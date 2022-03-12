import 'package:flutter/material.dart';
import 'package:ieee_flutter_app/core/design/widget_padding.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({Key? key, required this.iconData}) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const WidgetPadding.horizontal14(),
      child: Icon(
        iconData,
        color: Colors.black,
      ),
    );
  }
}
