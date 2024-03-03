import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matreshka/features/main/data/main_repository.dart';
import 'package:matreshka/features/main/logic/main/main_cubit.dart';

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

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Матрешки"),
        actions: [
          IconButton(
              onPressed: () {
                mainRepository.closeApp();
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                return Text(mainRepository.userScore.toString());
              },
            ),
            InkWell(
              onTap: () => BlocProvider.of<MainCubit>(context).incrementScore(),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
