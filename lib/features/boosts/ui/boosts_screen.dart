import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matreshka/features/boosts/data/boosts_repository.dart';
import 'package:matreshka/features/boosts/logic/boosts_cubit.dart';
import 'package:matreshka/features/boosts/ui/medium_boost_widget.dart';
import 'package:matreshka/features/boosts/ui/small_boost_widget.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';
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
    final boostsRepository = RepositoryProvider.of<BoostsRepository>(context);

    return BlocListener<BoostsCubit, BoostsState>(
      listener: (context, state) {
        if (state is BoostsSuccess || state is BoostsFail) {
          Navigator.pop(context);
        }

        if (state is BoostsLoading) {
          showDialog(
              context: context,
              builder: (context) =>
              const Center(
                child: CircularProgressIndicator.adaptive(),
              ));
        }
      },
      child: Container(
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
                            const SizedBox(
                              width: 10,
                            ),
                            BlocBuilder<MainCubit, MainState>(
                              builder: (context, state) {
                                return Text(
                                  mainRepository.user.score.toString(),
                                  style: AppFonts.font29w400
                                      .copyWith(color: Colors.white),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                    BlocBuilder<BoostsCubit, BoostsState>(
                      builder: (context, state) {
                        return SizedBox(
                            height: 109,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SmallBoostWidget(
                                //   title: 'Turbo',
                                //   activeSlots: 2,
                                //   assetSvg: 'rocket.svg',
                                //   onTap: () {},
                                //   width: size.width * 0.43,
                                // ),
                                // SizedBox(
                                //   width: size.width * 0.04,
                                // ),
                                SmallBoostWidget(
                                  title: 'Full Energy',
                                  activeSlots: mainRepository.user
                                      .activeFullEnergy,
                                  assetSvg: 'light.svg',
                                  onTap: () {
                                    BlocProvider.of<BoostsCubit>(context)
                                        .getFullEnergy();
                                  },
                                  width: size.width * 0.9,
                                ),
                              ],
                            ));
                      },
                    ),
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
                      child: BlocBuilder<BoostsCubit, BoostsState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              MediumBoostWidget(
                                title: 'Multitap',
                                lvl: boostsRepository.getCurrentMultiTapLvl(),
                                prise:
                                boostsRepository.getCurrentMultiTapPrice(),
                                assetIcon: 'multitap.svg',
                                onTap: () {
                                  BlocProvider.of<BoostsCubit>(context)
                                      .incrementScorePerClick();
                                },
                              ),
                              MediumBoostWidget(
                                title: 'Energy Limit',
                                lvl: boostsRepository.getCurrentEnergyLvl(),
                                prise: boostsRepository.getCurrentEnergyPrice(),
                                assetIcon: 'energy.svg',
                                onTap: () {
                                  BlocProvider.of<BoostsCubit>(context)
                                      .extendEnergyLimit();
                                },
                              ),
                              MediumBoostWidget(
                                title: 'Recharging speed',
                                lvl: boostsRepository.getCurrentRechargingLvl(),
                                prise: boostsRepository.getCurrentRechargingPrise(),
                                assetIcon: 'light.svg',
                                onTap: () {
                                  BlocProvider.of<BoostsCubit>(context)
                                      .incrementRechargingSpeed();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
