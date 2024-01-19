import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:muslimmovie/model/card_class.dart';
import 'package:muslimmovie/view/home_page.dart';
import 'package:muslimmovie/view/widget/Card_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late SharedPreferences loginData;
  late bool newUser;
  List<CardClass> data = [
    CardClass(title: "MARVEL", image: "assets/anim/anim1.json"),
    CardClass(title: "VIRTUAL", image: "assets/anim/anim2.json"),
    CardClass(title: "LIVE", image: "assets/anim/anim3.json"),
  ];
@override
  void initState() {
    checkLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ConcentricPageView(
        onChange: (page) {
          loginData.setBool("login", false);
        },
        nextButtonBuilder: (context) =>  Icon(Icons.skip_next_rounded,color: Colors.white,size: size.height*0.08),
        itemCount: data.length,
        scaleFactor: BorderSide.strokeAlignInside,
        colors: const [Colors.red, Colors.grey, Colors.black38],
        physics: const NeverScrollableScrollPhysics(),
        duration: const Duration(seconds: 1),
        itemBuilder: (index) {
          return CardOnboarding(
            data: data[index],
          );
        },
        onFinish: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));

        },
      ),
    );
  }
  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool("login") ?? true);
    if (newUser == false) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    }
  }

}

