import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';


class InventoryPromoCard extends StatelessWidget {
  final MarketPromoModel promo;

  const InventoryPromoCard({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 93,
        width: size.width * 0.85,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              height: 93,
              width: size.width - 20,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppColors.cD9D9D9.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 67,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.4)),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.free_breakfast_outlined,
                      size: 40,
                      color: AppColors.c322A2A,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.46,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(promo.name,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.font20w400.copyWith(
                                color: AppColors.c322A2A,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/coin.png',
                              width: 27,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              promo.price.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: AppFonts.font15w400
                                  .copyWith(color: AppColors.c322A2A),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
