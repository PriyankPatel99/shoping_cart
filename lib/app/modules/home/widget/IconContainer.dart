import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Widget picture;

  final Function pressed;
  const IconContainer({Key? key, required this.picture, required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16)),
        child: IconButton(
          onPressed: pressed(),
          icon: picture,
        ));
  }
}
