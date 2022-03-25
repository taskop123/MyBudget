import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/database_service.dart';

import '../../service/storage_service.dart';
import '../../util/constants.dart';

class ProfileImageWidget extends StatefulWidget {
  final double profileHeight;

  const ProfileImageWidget(this.profileHeight, {Key? key}) : super(key: key);

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  String? profilePicture = CustomUser.current!.profilePicture;

  Future uploadImage() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) {
      return;
    }
    final path = result.files.single.path;
    if (path == null) {
      return;
    }
    final file = File(path);
    final destination =
        '${Constants.storageProfilePicturesUrl}${CustomUser.current!.id}';

    var task = StorageService.uploadFile(destination, file);
    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    RealtimeDatabaseService.updateUser(CustomUser.current!.id, urlDownload);
    setState(() {
      profilePicture = urlDownload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => uploadImage(),
      child: CircleAvatar(
        radius: widget.profileHeight / 1.9,
        backgroundColor: Colors.grey.shade700,
        backgroundImage: (profilePicture == null)
            ? Image.asset(Constants.avatarUrl).image
            : NetworkImage(profilePicture!),
      ),
    );
  }
}
