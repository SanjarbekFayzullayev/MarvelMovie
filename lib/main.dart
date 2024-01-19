import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslimmovie/view/onboarding_page.dart';
import 'package:muslimmovie/viewmodel/main_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainViewModel(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return const MaterialApp(
      color: Color(0xFF1A1A1D),
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      home: OnboardingPage(),
    );
  }
}
