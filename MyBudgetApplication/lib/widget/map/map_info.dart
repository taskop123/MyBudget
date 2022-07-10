import 'package:flutter/material.dart';

/// Defines the map info widget for displaying the information about the map.
class MapInfo extends StatelessWidget {
  /// Defines the text that should be displayed on the map.
  final String _text;

  /// Creates a map info widget with a given text to be displayed.
  const MapInfo(this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 6.0,
          ),
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ]),
          child: Text(
            _text,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ));
  }
}
