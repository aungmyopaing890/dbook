import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/master_colors.dart';
import '../../core/constant/dimesions.dart';
import '../../core/utils/utils.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor:
            Utils.isLightMode(context) ? Colors.white12 : Colors.black54,
        child: Container(
          decoration: BoxDecoration(
            color: MasterColors.black,
            borderRadius: BorderRadius.all(Radius.circular(Dimesion.height8)),
          ),
        ));
  }
}
