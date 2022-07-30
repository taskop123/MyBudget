import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../service/maps_service.dart';
import '../../util/constants.dart';
import '../../widget/form/button_form_field.dart';
import '../../widget/image_banner.dart';
import 'location_screen.dart';

/// The contact screen which shows the contact information of the company.
class ContactScreen extends StatefulWidget {
  /// The route name of the contact screen.
  static const routeName = Constants.contactRoute;

  /// Creates an instance of the [ContactScreen].
  const ContactScreen({Key? key}) : super(key: key);

  /// Creates the state object for the [ContactScreen].
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

/// State class used to display the contact screen elements.
class _ContactScreenState extends State<ContactScreen> {
  /// The build context of the state class for [ContactScreen].
  late BuildContext _buildContext;

  /// Navigates the current user to the [LocationScreen].
  ///
  void _navigateToLocationScreen() async {
    LatLng? currentUserLocation = await MapsService.getCurrentLocation();
    Navigator.of(_buildContext)
        .pushNamed(LocationScreen.routeName, arguments: currentUserLocation);
  }

  /// Builds the UI elements for the contact screen,
  /// including the [appBar] and a [body]
  /// with a [context] of the adequate contact content.
  ///
  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.contactTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 45, 40, 30),
        child: Center(
          child: Column(children: [
            const ImageBanner(Constants.logoUrl),
            const Padding(padding: EdgeInsets.fromLTRB(0, 40.0, 0, 2.0)),
            const Text(
              Constants.contactTextPlaceholder,
              style: TextStyle(fontSize: 24),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0)),
            const Text(
              Constants.contactEmail,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0)),
            const Text(
              Constants.contactFacebook,
              style:
                  TextStyle(fontSize: 16, decoration: TextDecoration.underline),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 3.0, 0, 3.0)),
            const Text(
              Constants.contactInstagram,
              style:
                  TextStyle(fontSize: 16, decoration: TextDecoration.underline),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 3.0, 0, 3.0)),
            const Text(
              Constants.contactLinkedIn,
              style:
                  TextStyle(fontSize: 16, decoration: TextDecoration.underline),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 3.0, 0, 15.0)),
            ButtonFormField(
                const EdgeInsets.fromLTRB(0, 20, 0, 10),
                _navigateToLocationScreen,
                Constants.locationTitle,
              null,
              null
            ),
          ]),
        ),
      ),
    );
  }
}
