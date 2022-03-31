import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../service/maps_service.dart';
import '../../util/constants.dart';
import '../../widget/form/button_form_field.dart';
import '../../widget/image_banner.dart';
import '../../widget/menu/popup_menu.dart';
import 'location_screen.dart';

class ContactScreen extends StatefulWidget {
  static const routeName = Constants.contactRoute;

  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late BuildContext _buildContext;
  late Function()? _logoutFunction;

  void _navigateToLocationScreen() async {
    LatLng? currentUserLocation = await MapsService.getCurrentLocation();
    Navigator.of(_buildContext).pushNamed(LocationScreen.routeName,
        arguments: currentUserLocation);
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    _logoutFunction = ModalRoute.of(context)!.settings.arguments as Function()?;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.contactTitle),
        actions: const [
          PopupMenu(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 30),
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
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
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
                Colors.blue,
                Colors.white),
          ]),
        ),
      ),
    );
  }
}
