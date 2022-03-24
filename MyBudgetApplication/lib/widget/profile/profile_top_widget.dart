import 'package:flutter/cupertino.dart';
import 'package:my_budget_application/widget/profile/profile_cover_image.dart';
import 'package:my_budget_application/widget/profile/profile_image.dart';

class ProfileTopWidget extends StatelessWidget {
  final double coverHeight;
  final double profileHeight;

  const ProfileTopWidget(this.coverHeight, this.profileHeight, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: (profileHeight / 2)),
          child: ProfileCoverImageWidget(coverHeight),
        ),
        Positioned(
          top: (coverHeight - profileHeight / 2),
          child: ProfileImageWidget(profileHeight),
        ),
      ],
    );
  }
}
