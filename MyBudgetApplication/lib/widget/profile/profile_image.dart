import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/firebase/users_repository.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../service/firebase/storage_service.dart';
import '../../util/constants.dart';

/// Defines the profile image widget for displaying
/// the current user's profile image.
class ProfileImageWidget extends StatefulWidget {
  /// Defines the height of the image.
  final double profileHeight;

  /// Defines the current user.
  final CustomUser currentUser;

  /// Creates new profile image widget with the given current user
  /// and height of the image.
  const ProfileImageWidget(this.currentUser, this.profileHeight, {Key? key})
      : super(key: key);

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

/// Defines the state of the profile image widget.
class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  /// Defines the path to the profile image.
  late String? profilePicture;

  /// Uploads image selected from the device that the user is using
  /// to the FireBase cloud database.
  Future uploadImage(BuildContext context) async {
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
        '${Constants.storageProfilePicturesUrl}${widget.currentUser.id}';

    var task = StorageService.uploadFile(destination, file);
    if (task == null) return;

    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(max: 100, msg: Constants.progressDialogPlaceholder,
        barrierDismissible: false, barrierColor: Colors.black54);

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    UserRepository.updateUserProfile(
        widget.currentUser.id, urlDownload, null, null, null);
    setState(() {
      profilePicture = urlDownload;
    });

    progressDialog.close();
    var count = 0;
    Navigator.popUntil(context, (route) {
      return count++ == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    profilePicture = widget.currentUser.profilePicture;
    return GestureDetector(
      onTap: () => uploadImage(context),
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
