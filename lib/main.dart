import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matreshka/firebase_options.dart';
import 'package:matreshka/providers.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AppRepositoryProviders());
}