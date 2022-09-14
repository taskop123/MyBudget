import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/widget/profile/profile_cover_image.dart';
import 'package:my_budget_application/widget/profile/profile_image.dart';

/// Defines the profile top widget for displaying the image of the current user.
class ProfileTopWidget extends StatelessWidget {
  /// Defines the height of the cover image.
  final double coverHeight;

  /// Defines the height of the profile image.
  final double profileHeight;

  /// Defines the current user.
  final CustomUser currentUser;

  /// Creates new profile top widget with the given [currentUser],
  /// [coverHeight] and the [profileHeight.
  const ProfileTopWidget(this.currentUser, this.coverHeight, this.profileHeight,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: (profileHeight / 2)),
          child: ProfileCoverImageWidget(coverHeight, currentUser),
        ),
        Positioned(
          top: (coverHeight - profileHeight / 2),
          child: ProfileImageWidget(currentUser, profileHeight),
        ),
      ],
    );
  }
}
