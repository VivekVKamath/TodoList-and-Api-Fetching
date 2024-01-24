import 'dart:async';
import 'package:ffgame3/ui/ffgame3/review.dart';
import 'package:flutter/material.dart';
import '../../components/colors.dart';
import '../../components/config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OneTimePage extends StatefulWidget {
  final String text;

  const OneTimePage ({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<OneTimePage > createState() => _OneTimePageState();
}

class _OneTimePageState extends State<OneTimePage > {
  bool error = false;

  bool flag = false;

  bool flag1 = false;

  final formKey2 = GlobalKey<FormState>();

  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;
  var submitbutton = COLORS.blueSecondary;
  bool submitflag = true;
  bool onetime = false;
  bool isloadingotp = false;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
      if (secondsRemaining == 0) {
        flag1 = true;
      } else if (secondsRemaining != 0) {
        flag1 = false;
      }
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  void resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: formKey2,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight*26),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(SizeConfig.blockHeight*2),
                      child: Image.network(
                          "https://images.indianexpress.com/2021/04/Asus-ROG-Phone-5-1200.jpg",
                          height: SizeConfig.blockHeight*18,
                          width: SizeConfig.blockWidth*32,
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockHeight * 6),
                    height: SizeConfig.blockHeight * 45,
                    width: SizeConfig.screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'OTP Verification',
                          style: TextStyle(
                              fontSize: SizeConfig.blockWidth*6,
                              fontFamily: "Nunitosans"
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockHeight,),
                        Text(
                          'Please enter the OTP sent to your mobile',
                          style: TextStyle(
                              color: COLORS.blackLight,
                              fontFamily: "Nunitosans",
                              fontSize: SizeConfig.blockHeight*1.8
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'number ',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockHeight * 1.8,
                                  color: COLORS.blackLight,
                                  fontFamily: "Nunitosans",

                              ),
                            ),
                            Text(
                              '+91 ',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockHeight * 1.8,
                                  color: COLORS.blackLight,
                                  fontFamily: "Nunitosans"),
                            ),
                            SizedBox(width: SizeConfig.blockWidth * 1),
                            Text(
                              widget.text,
                              style: TextStyle(
                                  fontSize: SizeConfig.blockHeight*1.8,
                                  color: COLORS.blackLight,
                                  fontFamily: "Nunitosans"),
                            ),
                            SizedBox(width: SizeConfig.blockWidth * 1),
                            Icon(
                              Icons.edit,
                              color: COLORS.accentDark,
                              size: SizeConfig.blockHeight *1.8,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  },
                                child: Text(
                                  'EDIT',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockHeight * 1.8,
                                      color: COLORS.accentDark,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunitosans"),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockHeight * 3,
                        ),
                        PinCodeTextField(
                          scrollPadding: EdgeInsets.only(bottom: SizeConfig.blockHeight*22),
                          length: 4,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                submitbutton = COLORS.blueSecondary;
                                submitflag = true;
                                onetime = false;
                              }else if (value == "1111") {
                                flag = false;
                                submitbutton = COLORS.accent;
                                submitflag = true;
                                onetime = true;
                              } else {
                                flag = true;
                                submitbutton = COLORS.accent;
                                submitflag = false;
                                onetime = false;
                              }
                            });
                          },
                          appContext: context,
                          cursorColor: Colors.black,
                          cursorHeight: SizeConfig.blockHeight * 2.5,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.blockHeight * 0.7)
                              ),
                              borderWidth: SizeConfig.blockHeight * 0.2,
                              fieldHeight: SizeConfig.blockHeight * 7,
                              fieldWidth: SizeConfig.blockWidth * 12,

                              disabledColor: COLORS.blueSecondary,
                              selectedColor: COLORS.blackLight,
                              inactiveColor: COLORS.blueSecondary,
                              activeColor:
                              error ? COLORS.red : COLORS.blackLight,
                              fieldOuterPadding: EdgeInsets.only(
                                  top: SizeConfig.blockHeight * 2,
                                  bottom: SizeConfig.blockHeight * 2,
                                  left: SizeConfig.blockWidth * 3.1,
                                  right: SizeConfig.blockWidth * 3.1,
                              )
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: SizeConfig.blockWidth * 3,
                            ),
                            Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: error,
                              child: Text(
                                'Invalid Otp',
                                style: TextStyle(
                                    color: COLORS.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockHeight * 2,
                                    fontFamily: "Nunitosans"
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockWidth * 43,
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: flag1,
                              child: InkWell(
                                onTap: enableResend ? resendCode : null,
                                child: Text(
                                  'Resend',
                                  style: TextStyle(
                                      color: COLORS.accentDark,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.blockHeight * 2),
                                ),
                              ),
                            ),
                            Visibility(
                              maintainSize: false,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: !flag1,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: SizeConfig.blockWidth * 3,
                                  ),
                                  Text(
                                    '0:$secondsRemaining',
                                    style: TextStyle(
                                        color: COLORS.black,
                                        fontSize: SizeConfig.blockHeight * 2.1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),


                        SizedBox(
                          height: SizeConfig.blockHeight * 5,
                        ),
                        SizedBox(
                            height: SizeConfig.blockHeight * 7,
                            width: SizeConfig.blockHeight * 62,
                            child: ElevatedButton(
                              onPressed: onetime ? () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  error = false;
                                  isloadingotp = true;
                                });

                                Future.delayed(const Duration(seconds: 3),
                                        () {
                                      setState(() {
                                        isloadingotp = false;
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReviewPage()));
                                      });
                                    });
                              } : submitflag ? null : () {FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  if (flag == false) {
                                    error = false;
                                  } else {
                                    error = true;
                                  }
                                });
                              },
                              style:  ElevatedButton.styleFrom(
                                  backgroundColor: submitbutton,
                                  fixedSize: Size(
                                      SizeConfig.blockWidth*100,
                                      SizeConfig.blockHeight*7
                                  )
                              ),
                              child: isloadingotp ? SizedBox(
                                  height: SizeConfig.blockHeight * 2.7,
                                  width: SizeConfig.blockWidth * 4.5,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth:
                                    SizeConfig.blockHeight * 0.3,
                                  )
                              ) : Text('SUBMIT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                    SizeConfig.blockHeight * 2.5,
                                    fontFamily: "Nunitosans",
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
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