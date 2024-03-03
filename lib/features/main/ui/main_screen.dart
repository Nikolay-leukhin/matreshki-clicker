import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';
import 'package:matreshka/routes/routes_names.dart';
import 'package:matreshka/utils/fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainRepository mainRepository;

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
              fit: BoxFit.cover, image: AssetImage("assets/images/bg.png"))),
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
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/money.png",
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  BlocBuilder<MainCubit, MainState>(
                    builder: (context, state) {
                      return Text(
                        mainRepository.user.score.toString(),
                        style: AppFonts.font32w400,
                      );
                    },
                  ),
                ],
              ),
              GestureDetector(
                onTap: () =>
                    BlocProvider.of<MainCubit>(context).incrementScore(),
                child: Ink(
                  height: size.height * 0.5,
                  child: Image.asset(
                    "assets/images/japan.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Spacer(),
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
                            Text(
                              "6000",
                              style: AppFonts.font29w400
                                  .copyWith(color: Colors.white, height: 0),
                            ),
                            Text("/6000",
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
                      child: Row(
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
              )
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
