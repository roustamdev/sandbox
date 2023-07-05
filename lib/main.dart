import 'package:eds_test/core/config/logging/cubit_observer.dart';
import 'package:eds_test/dependency_injection.dart';
import 'package:eds_test/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await setUpDI();
  Bloc.observer = CubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task Application',
      home: MainPage(),
    );
  }
}
