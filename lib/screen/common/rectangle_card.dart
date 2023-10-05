import 'package:dbook/config/master_colors.dart';
import 'package:flutter/material.dart';
import '../../core/constant/dimesions.dart';

class RectangleCard extends StatelessWidget {
  const RectangleCard(
      {Key? key,
      required this.widget,
      this.color,
      this.width,
      this.vert,
      this.radius})
      : super(key: key);
  final Widget widget;
  final Color? color;
  final double? width;
  final double? radius;
  final double? vert;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: width ?? Dimesion.width10, vertical: vert ?? 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? Dimesion.radius15)),
      color: color ?? Colors.white,
      shadowColor: MasterColors.mainColor,
      // borderOnForeground: true,
      // shadowColor: const Color.fromARGB(255, 0, 255, 72),
      elevation: 3,
      child: widget,
    );
  }
}
