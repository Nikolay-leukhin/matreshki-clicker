import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/features/boosts/ui/medium_boost_widget.dart';
import 'package:matreshka/features/boosts/ui/small_boost_widget.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/market/data/market_repository.dart';
import 'package:matreshka/features/market/logic/cubit/market_cubit.dart';
import 'package:matreshka/features/market/ui/market_doll_card.dart';
import 'package:matreshka/features/market/ui/market_promo_card.dart';
import 'package:matreshka/utils/fonts.dart';

class BoostsScreen extends StatefulWidget {
  const BoostsScreen({super.key});

  @override
  State<BoostsScreen> createState() => _BoostsScreenState();
}

class _BoostsScreenState extends State<BoostsScreen> {
  final controller = ScrollController();
  final pageScrollController2 = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final mainRepository = RepositoryProvider.of<MainRepository>(context);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/bg2.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'balance',
                        style:
                        AppFonts.font15w400.copyWith(color: Colors.white),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            width: 27,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            mainRepository.user.score.toString(),
                            style:
                                AppFonts.font29w400.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Free daily boosters",
                          style: AppFonts.font20w400.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 109,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SmallBoostWidget(title: 'Turbo', activeSlots: 2, assetSvg: 'rocket.svg',),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          const SmallBoostWidget(title: 'Full Energy', activeSlots: 2, assetSvg: 'light.svg',),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Boosts",
                          style: AppFonts.font20w400.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.width * 0.60 + 10,
                    child: const Column(
                      children: [
                        MediumBoostWidget(title: 'Multitap', lvl: 10, prise: 500,assetIcon: 'multitap.svg',),
                        MediumBoostWidget(title: 'Energy Limit', lvl: 11, prise: 1000, assetIcon: 'energy.svg',),
                        MediumBoostWidget(title: 'Recharging speed', lvl: 11, prise: 1000, assetIcon: 'light.svg',),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
