import 'package:flutter/material.dart';

class ProfileNumbersWidget extends StatelessWidget {
  const ProfileNumbersWidget({Key? key}) : super(key: key);

  Widget buildButton({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '$value',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );

  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(),
      );

  @override
  Widget build(BuildContext context) {
    // TODO: Insert real data about current user here
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(text: 'Projects', value: 39),
        buildDivider(),
        buildButton(text: 'Following', value: 529),
        buildDivider(),
        buildButton(text: 'Followers', value: 5834),
        buildDivider(),
      ],
    );
  }
}
