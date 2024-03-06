import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matreshka/features/inventory/ui/inventory_doll_card.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/market/data/market_repository.dart';
import 'package:matreshka/features/market/logic/cubit/market_cubit.dart';
import 'package:matreshka/features/market/ui/market_doll_card.dart';
import 'package:matreshka/features/market/ui/market_promo_card.dart';

import 'package:matreshka/utils/fonts.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final controller = ScrollController();
  final pageScrollController1 = PageController(viewportFraction: 0.9);
  final pageScrollController2 = PageController(viewportFraction: 0.9);
  late final MainRepository mainRepository;

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
                        width: 60,
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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Promo",
                  //         style: AppFonts.font20w400.copyWith(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  // SizedBox(
                  //   height: 109,
                  //   child: BlocBuilder<MarketCubit, MarketState>(
                  //     builder: (context, state) {
                  //       if (state is MarketLoading) {
                  //         return const Center(
                  //           child: CircularProgressIndicator.adaptive(),
                  //         );
                  //       } else if (state is MarketSuccess) {
                  //         return PageView(
                  //             controller: pageScrollController1,
                  //             scrollDirection: Axis.horizontal,
                  //             children: mainRepository.user.userSkins
                  //                 .map((model) => RepaintBoundary(
                  //                         child: InventoryMatreshkaCard(
                  //                       sk: model,
                  //                     )))
                  //                 .toList());
                  //       }
                  //       return Text("fail to load");
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 5,
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
                    height: size.width * 0.85 + 10,
                    child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageScrollController2,
                        children: mainRepository.user.userSkins
                            .map((model) => RepaintBoundary(
                                    child: InventoryMatreshkaCard(
                                  skin: model,
                                )))
                            .toList()),
                  )

                  // SizedBox(
                  //   height: size.width * 0.85 + 10,
                  //   child: BlocBuilder<MarketCubit, MarketState>(
                  //     builder: (context, state) {
                  //       if (state is MarketLoading) {
                  //         return const Center(
                  //           child: CircularProgressIndicator.adaptive(),
                  //         );
                  //       } else if (state is MarketSuccess) {
                  //         return PageView(
                  //             scrollDirection: Axis.horizontal,
                  //             controller: pageScrollController2,
                  //             children: mainRepository.user.userSkins
                  //                 .map((model) => RepaintBoundary(
                  //                         child: InventoryMatreshkaCard(
                  //                       skin: model,
                  //                     )))
                  //                 .toList());
                  //       }
                  //       return Text("fail to load");
                  //     },
                  //   ),
                  // ),
                ],
              )),
        ),
      ),
    );
  }
}
