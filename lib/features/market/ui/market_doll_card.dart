import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/ui/main_screen.dart';
import 'package:matreshka/features/market/logic/buy/buy_cubit.dart';
import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';

class MarketMatreshkaCard extends StatefulWidget {
  final MarketSkinModel skin;

  const MarketMatreshkaCard({super.key, required this.skin});

  @override
  State<MarketMatreshkaCard> createState() => _MarketMatreshkaCardState();
}

class _MarketMatreshkaCardState extends State<MarketMatreshkaCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: size.width * 0.55 + 85,
        width: size.width * 0.55 + 85,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
              height: size.width * 0.85,
              width: size.width * 0.85,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppColors.cD9D9D9.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: size.width * 0.46,
                        child: Image.asset(
                          widget.skin.iconPath,
                          height: size.width * 0.55,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            widget.skin.coinIconPath,
                            height: 50,
                            fit: BoxFit.fitHeight,
                          ),
                          Text(widget.skin.coinName,
                              style: AppFonts.font20w400
                                  .copyWith(color: AppColors.c322A2A))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 2,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (isInInventory() == false && context.read<MainRepository>().user.score > widget.skin.price) {
                        context
                            .read<BuyCubit>()
                            .buyItem(ProductTypes.skin, widget.skin);
                      }
                    },
                    child: Container(
                      height: 52,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white.withOpacity(0.4)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            height: 30,
                            fit: BoxFit.fitHeight,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            isInInventory() == false
                                ? widget.skin.price.toString()
                                : "You have this",
                            style: AppFonts.font18w400
                                .copyWith(color: AppColors.c322A2A),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  bool isInInventory() {
    final data =
        (context.read<MainRepository>().user.userSkins.map((e) => e.id));
    return data.contains(widget.skin.id);
  }
}
