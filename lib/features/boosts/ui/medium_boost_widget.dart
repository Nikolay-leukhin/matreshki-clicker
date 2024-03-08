import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';

class MediumBoostWidget extends StatelessWidget {
  final String title;
  final int lvl;
  final int prise;
  final String assetIcon;
  final Function() onTap;

  const MediumBoostWidget(
      {super.key,
      required this.title,
      required this.lvl,
      required this.prise,
      required this.assetIcon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 80,
          width: size.width * 0.91,
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
                        Text(
                          title,
                          style: AppFonts.font18w400,
                          textAlign: TextAlign.start,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: prise.toString(),
                                  style: AppFonts.font11w400
                                      .copyWith(color: AppColors.gold)),
                              TextSpan(
                                  text: ' * ${lvl} lvl',
                                  style: AppFonts.font11w400
                                      .copyWith(color: AppColors.white10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/$assetIcon',
                      width: 62,
                      height: 62,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
