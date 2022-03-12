import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(
            context.width * 0.8,
            context.height * 0.05,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text("GET STARTED"),
    );
  }
}
