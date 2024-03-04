import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';
import 'package:matreshka/models/market_model.dart';
import 'package:matreshka/utils/fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainRepository mainRepository;
  double k = 0;

  _onTapUp() {
    setState(() {
      k = 0;
    });
  }

  _onTapDown() {
    setState(() {
      k = 0.02;
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
    super.initState();
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
        body: Container(
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
                        style:
                            AppFonts.font40w400.copyWith(color: Colors.white),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTapDown: (_) {
                  _onTapDown();
                  BlocProvider.of<MainCubit>(context).incrementScore();
                },
                onTapUp: (_) {
                  _onTapUp();
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 100),
                  height: size.height * 0.5,
                  padding: EdgeInsets.all(size.height * k),
                  child: Image.asset(
                    "assets/images/japan.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
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
                                  mainRepository.user.currentEnergy.toString(),
                                  style: AppFonts.font29w400
                                      .copyWith(color: Colors.white, height: 0),
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
                          color: Color(0xff8A0D06).withOpacity(0.7)),
                      child: const Row(
                        children: [
                          NavButton(
                            path: 'assets/icons/fire.svg',
                            text: "boost",
                          ),
                          const SizedBox(
                            width: 37,
                          ),
                          NavButton(
                            path: 'assets/icons/bag.svg',
                            text: "shop",
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
                      barRadius: Radius.circular(20),
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
      )),
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final String path;

  const NavButton({
    super.key,
    required this.text,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
