import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/features/inventory/logic/choose_doll/choose_doll_cubit.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';
import 'package:matreshka/models/swim_digit_model.dart';
import 'package:matreshka/routes/routes_names.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rxdart/subjects.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainRepository mainRepository;
  final streamOnDigit = BehaviorSubject.seeded(true);
  double matreshkaSize = 0;
  List<SwimDigit> swimDigits = [];

  _onTapUp() {
    setState(() {
      matreshkaSize = 0;
    });
  }

  _onTapDown(TapDownDetails details) async {
    swimDigits.add(SwimDigit(
        dx: details.globalPosition.dx,
        dy: details.globalPosition.dy,
        heightSwim: details.globalPosition.dy - 150,
        digit: 1));

    HapticFeedback.mediumImpact();

    setState(() {
      matreshkaSize = 0.02;
    });
  }

  @override
  void dispose() async {
    await mainRepository.updateData();
    super.dispose();
  }

  @override
  void initState() {
    mainRepository = RepositoryProvider.of<MainRepository>(context);

    const oneSec = Duration(seconds: 1);
    const oneMilliSec = Duration(milliseconds: 5);

    Timer.periodic(
      oneSec,
          (Timer timer) {
        if (timer.tick % 2 == 0) {
          BlocProvider.of<MainCubit>(context).incrementBar();
        }
      },
    );

    Timer.periodic(
      oneMilliSec,
          (Timer timer) {
        setCurrentFrame();
        streamOnDigit.add(true);
      },
    );

    super.initState();
  }

  setCurrentFrame() {
    for (var element in swimDigits) {
      if (element.dy - 3 > element.heightSwim) {
        element.dy -= 1.5;
      }
    }

    swimDigits = swimDigits
        .where((element) => element.dy != element.heightSwim)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/bg2.png"))),
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/money.png",
                            width: 75,
                            height: 75,
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                              return Text(
                                mainRepository.user.score.toString(),
                                style: AppFonts.font40w400
                                    .copyWith(color: Colors.white),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<ChooseDollCubit, ChooseDollState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTapDown: (TapDownDetails details) {
                              _onTapDown(details);
                              BlocProvider.of<MainCubit>(context)
                                  .incrementScore();
                            },
                            onTapUp: (_) {
                              _onTapUp();
                            },
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              duration: const Duration(milliseconds: 100),
                              height: size.height * 0.5,
                              padding: EdgeInsets.all(
                                  size.height * matreshkaSize),
                              child: Image.asset(
                                mainRepository.user.userSkins
                                    .where((e) =>
                                e.id == mainRepository.user.activeSckinId)
                                    .first
                                    .iconPath,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/light.svg",
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BlocBuilder<MainCubit, MainState>(
                                      builder: (context, state) {
                                        return Text(
                                          mainRepository.user.currentEnergy
                                              .toString(),
                                          style: AppFonts.font29w400.copyWith(
                                              color: Colors.white, height: 0),
                                        );
                                      },
                                    ),
                                    Text("/${mainRepository.user.maxEnergy}",
                                        style: AppFonts.font13w400
                                            .copyWith(color: Colors.grey)),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: const Color(0xff8A0D06).withOpacity(
                                      0.7)),
                              child: Row(
                                children: [
                                  NavButton(
                                    path: 'assets/icons/fire.svg',
                                    text: "boost",
                                    onTap: () =>
                                        Navigator.pushNamed(
                                            context, AppRouteNames.boosts),
                                  ),
                                  const SizedBox(
                                    width: 37,
                                  ),
                                  NavButton(
                                    path: 'assets/icons/bag.svg',
                                    text: "shop",
                                    onTap: () =>
                                        Navigator.pushNamed(
                                            context, AppRouteNames.market),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                        child: BlocBuilder<MainCubit, MainState>(
                          builder: (context, state) {
                            return LinearPercentIndicator(
                              width: size.width - 20,
                              lineHeight: 14,
                              percent: mainRepository.user.currentEnergy /
                                  mainRepository.user.maxEnergy,
                              backgroundColor: Colors.white.withOpacity(0.4),
                              linearGradient: const LinearGradient(
                                colors: [Color(0xffff4b1f), Color(0xffff9068)],
                                stops: [0, 1],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              ),
                              barRadius: const Radius.circular(20),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouteNames.inventory);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff430505)),
                        child: SvgPicture.asset(
                          "assets/icons/inventory.svg",
                          width: 40,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
                  ],
                ),
                StreamBuilder<bool>(
                  stream: streamOnDigit,
                  builder: (context, state) {
                    return Stack(
                      children: swimDigits.map((e) {
                        return Positioned(
                            left: e.dx,
                            top: e.dy,
                            child: GestureDetector(
                              onTapDown: (TapDownDetails details) {
                                _onTapDown(details);
                                BlocProvider.of<MainCubit>(context)
                                    .incrementScore();
                              },
                              onTapUp: (_) {
                                _onTapUp();
                              },
                              child: Text(
                                e.digit.toString(),
                                style: AppFonts.font29w400.copyWith(
                                    color: AppColors.white10
                                        .withOpacity((e.dy - e.heightSwim) / 150)),
                              ),
                            ));
                      }).toList(),
                    );
                  },
                )
              ],
            ),
          )),
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final String path;
  final Function onTap;

  const NavButton(
      {super.key, required this.text, required this.path, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        children: [
          SvgPicture.asset(
            path,
            height: 40,
          ),
          Text(
            text,
            style: AppFonts.font11w400.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
