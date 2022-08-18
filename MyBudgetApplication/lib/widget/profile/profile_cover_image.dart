import 'package:flutter/material.dart';
import 'package:my_budget_application/model/user.dart';

/// Defines the profile cover image widget which is used as a placeholder for
/// the current user's profile image.
class ProfileCoverImageWidget extends StatelessWidget {
  /// Defines the height of the image.
  final double coverHeight;

  /// The currently logged in user.
  final CustomUser _currentUser;

  /// Creates new profile cover image widget
  /// with the specified [coverHeight] and the [_currentUser].
  const ProfileCoverImageWidget(this.coverHeight, this._currentUser, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (!_currentUser.themeDarkEnabled) ? Colors.lightBlueAccent : null,
      child: SizedBox(
        width: double.infinity,
        height: coverHeight,
      ),
    );
  }
}
