import 'package:flutter/material.dart';

/// Defines the profile cover image widget which is used as a placeholder for 
/// the current user's profile image.
class ProfileCoverImageWidget extends StatelessWidget {
  /// Defines the height of the image.
  final double coverHeight;

  /// Creates new profile cover image widget with the specified height.
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
