import 'package:flutter/cupertino.dart';

class VericalSpacing extends StatelessWidget {
  final double height;
  // ignore: use_key_in_widget_constructors
  const VericalSpacing(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
