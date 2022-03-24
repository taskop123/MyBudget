import 'package:flutter/material.dart';

class ProfileCoverImageWidget extends StatelessWidget {
  final double coverHeight;

  const ProfileCoverImageWidget(this.coverHeight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: SizedBox(
        width: double.infinity,
        height: coverHeight,
      ),
    );
  }
}
