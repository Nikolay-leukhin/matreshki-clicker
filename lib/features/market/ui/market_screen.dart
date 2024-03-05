import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final controller = ScrollController();
  final pageScrollController1 = PageController(viewportFraction: 0.9);
  final pageScrollController2 = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/bag.svg",
                        width: 100,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "SHOP",
                        style:
                            AppFonts.font29w400.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Promo",
                          style: AppFonts.font20w400.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 109,
                    child: PageView(
                      controller: pageScrollController1,
                        scrollDirection: Axis.horizontal,
                        children: [1, 2, 3, 2, 3, 2, 3, 2, 3]
                            .map((e) =>
                                const RepaintBoundary(child: MarketPromoCard()))
                            .toList()),
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
                          "Skins",
                          style: AppFonts.font20w400.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.width * 0.85,
                    child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageScrollController2,
                        children: [1, 2, 3, 2, 3, 2, 3, 2, 3]
                            .map((e) => const RepaintBoundary(
                                child: MarketMatreshkaCard()))
                            .toList()),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class MarketPromoCard extends StatelessWidget {
  const MarketPromoCard({super.key});

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
                        Text("Promo name",
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
                              "99999",
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

class MarketMatreshkaCard extends StatelessWidget {
  const MarketMatreshkaCard({super.key});

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
                          'assets/images/japan.png',
                          height: size.width * 0.55,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/coin.png',
                            height: 50,
                            fit: BoxFit.fitHeight,
                          ),
                          Text('Emerald', style: AppFonts.font20w400
                              .copyWith(color: AppColors.c322A2A))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Divider(height: 2,),
                  const Spacer(),
                  Container(
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
                        SizedBox(width: 10,),
                        Text('670', style: AppFonts.font18w400.copyWith(color: AppColors.c322A2A),)
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

class MarketWrapper extends StatelessWidget {
  const MarketWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.hardEdge,
      width: size.width * 0.61,
      height: size.width * 0.61,
      decoration: BoxDecoration(
          color: AppColors.cD9D9D9.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      ),
    );
  }
}
