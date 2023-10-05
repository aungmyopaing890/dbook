import 'package:flutter/material.dart';

import '../../config/master_colors.dart';
import '../../core/constant/dimesions.dart';
import 'rectangle_card.dart';

class BigButton extends StatelessWidget {
  const BigButton({Key? key, required this.text, required this.buttonColor})
      : super(key: key);
  final String text;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return RectangleCard(
      widget: Container(
        alignment: Alignment.center,
        height: Dimesion.height40,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(Dimesion.radius15)),
        child: Text(
          text,
          style: TextStyle(
              color: MasterColors.white,
              fontSize: Dimesion.font12,
              fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}

class BigButtonOutline extends StatelessWidget {
  const BigButtonOutline({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return RectangleCard(
      widget: Container(
        alignment: Alignment.center,
        height: Dimesion.height40,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            // color: MasterColors.mainColor,
            border: Border.all(color: MasterColors.mainColor),
            borderRadius: BorderRadius.circular(Dimesion.radius5)),
        child: Text(
          text,
          style: TextStyle(
              color: MasterColors.textColor1,
              fontSize: Dimesion.font16,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
