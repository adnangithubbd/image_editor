import 'package:flutter/material.dart';

import '../models/text_info.dart';

class ImageText extends StatelessWidget {
  final TextInfo textInfo;
    ImageText({super.key, required this.textInfo});

  @override
  Widget build(BuildContext context) {
    return Text(
      textInfo.text,
      textAlign: textInfo.textAlign,
       style: TextStyle(
        color: textInfo.color,
        fontWeight: textInfo.fontWeight,
        fontStyle: textInfo.fontStyle,
        fontSize: textInfo.fontSize,
      ),
    );
  }
}
