import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';


class SmallBoostWidget extends StatelessWidget {
  final String title;
  final int activeSlots;
  final String assetSvg;

  const SmallBoostWidget({super.key, required this.title, required this.activeSlots, required this.assetSvg});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 80,
      width: size.width * 0.43,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
            height: 62,
            width: size.width * 0.45,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: AppColors.cD9D9D9.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppFonts.font15w400, textAlign: TextAlign.start,),
                    Text('${activeSlots}/3 Available', style: AppFonts.font11w400.copyWith(color: AppColors.white10),),
                  ],
                ),
                SvgPicture.asset(
                  "assets/icons/${assetSvg}",
                  height: 40,
                ),
              ],
            )),
      ),
    );
  }
}
