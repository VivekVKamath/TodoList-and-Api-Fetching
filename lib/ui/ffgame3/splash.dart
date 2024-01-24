import 'package:ffgame3/components/config.dart';
import 'package:ffgame3/ui/ffgame3/phonenumber.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import '../../components/colors.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const NumberPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: SizeConfig.screenHeight,
            padding: EdgeInsets.only(
                top: SizeConfig.blockHeight*29,
                left: SizeConfig.blockWidth*15,
                right: SizeConfig.blockWidth*15
            ),
            child: Column(
              children: [
                Container(
                  height: SizeConfig.blockHeight*6.6,
                  width: SizeConfig.blockWidth*60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: COLORS.accentLight,
                  ),
                  child: Center(
                    child: Text("Master the art",
                      style: TextStyle(
                          color: COLORS.blueShade,
                          fontFamily: "Nunito Sans",
                          fontSize: SizeConfig.blockHeight*4,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                Lottie.asset(
                    "assets/lottie/lottie.json",
                  height: SizeConfig.blockHeight*40
                ),
                Text("The only way to go fast\nis to go well.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: COLORS.accent,
                      fontFamily: "Nunito Sans",
                      fontSize: SizeConfig.blockHeight*3.6,
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
