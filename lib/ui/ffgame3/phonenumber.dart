import 'package:ffgame3/components/colors.dart';
import 'package:ffgame3/components/config.dart';
import 'package:flutter/services.dart';
import 'package:ffgame3/ui/ffgame3/otp.dart';
import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  TextEditingController phoneController = TextEditingController();
  var buttonblue = COLORS.blueSecondary;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isnotLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Container(
              height: SizeConfig.screenHeight,
              padding: EdgeInsets.only(
                  left: SizeConfig.blockHeight * 3,
                  right: SizeConfig.blockHeight * 3),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockHeight * 32,
                        bottom: SizeConfig.blockHeight * 27),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.blockHeight * 2),
                      child: Image.network(
                          "https://images.indianexpress.com/2021/04/Asus-ROG-Phone-5-1200.jpg",
                          height: SizeConfig.blockHeight * 18,
                          width: SizeConfig.blockWidth * 32,
                          fit: BoxFit.fill),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile Number",
                        style: TextStyle(
                          fontFamily: "NunitoSans",
                          fontSize: SizeConfig.blockWidth * 6,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight,
                  ),
                  Text(
                    "We need to send OTP to authenticate your Mobile Number",
                    style: TextStyle(
                        color: COLORS.blackLight,
                        fontSize: SizeConfig.blockHeight * 2,
                        fontFamily: "NunitoSans"),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.blockHeight * 8,
                        width: SizeConfig.blockWidth * 17,
                        decoration: BoxDecoration(
                            border: Border.all(color: COLORS.blueSecondary),
                            borderRadius:
                                BorderRadius.circular(SizeConfig.blockWidth)),
                        child: const Center(
                          child: Text(
                            "+91",
                            style: TextStyle(
                                fontFamily: "Nunito Sans",
                                color: COLORS.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth * 4,
                      ),

                      ///phone number validation
                      SizedBox(
                        height: SizeConfig.blockHeight * 11.5,
                        width: SizeConfig.blockWidth * 68,
                        child: TextFormField(
                          cursorColor: COLORS.black,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          onChanged: (value) {
                            setState(() {
                              if (value.length < 10) {
                                buttonblue = COLORS.accent;
                                isnotLoading = false;
                                isLoading = false;
                              } else if (phoneController.text.isEmpty) {
                                buttonblue = COLORS.blueSecondary;
                                isnotLoading = true;
                                isLoading = false;
                              } else {
                                buttonblue = COLORS.accent;
                                isnotLoading = false;
                              }
                            });
                          },
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          style: TextStyle(
                            fontSize: SizeConfig.blockHeight * 2.4,
                            color: COLORS.black,
                            fontFamily: "Nunitosans",
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.blockHeight * 2.5,
                                horizontal: SizeConfig.blockWidth * 5),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(SizeConfig.blockHeight * 1)),
                              borderSide: BorderSide(
                                  color: COLORS.blueSecondary,
                                  width: SizeConfig.blockHeight * .2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(SizeConfig.blockHeight * 1)),
                              borderSide: BorderSide(
                                  color: COLORS.black,
                                  width: SizeConfig.blockHeight * .1),
                            ),
                            hintText: "Enter your mobile Number",
                            hintStyle: TextStyle(
                                color: COLORS.shade,
                                fontSize: SizeConfig.blockHeight * 2,
                                fontFamily: "Nunitosans"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockHeight * 1)),
                          ),
                          validator: (value) {
                            if (value!.length < 10) {
                              return "Phone number is not valid";
                            } else if (value.contains(" ")) {
                              return "Phone number is not valid";
                            } else if (value.isEmpty) {
                              return "Phone number is not valid";
                            } else if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$')
                                .hasMatch(value)) {
                              return "Phone number is not valid";
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 3,
                  ),
                  ElevatedButton(
                    onPressed: isnotLoading
                        ? null
                        : () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              Future.delayed(const Duration(seconds: 3), () {
                                setState(() {
                                  isLoading = false;
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => OneTimePage(
                                            text: phoneController.text,
                                          )));
                                });
                              });
                            }
                          },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonblue,
                        fixedSize: Size(SizeConfig.blockWidth * 100,
                            SizeConfig.blockHeight * 7)),
                    child: isLoading
                        ? SizedBox(
                            height: SizeConfig.blockHeight * 2.7,
                            width: SizeConfig.blockWidth * 4.5,
                            child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: SizeConfig.blockHeight * 0.5))
                        : Text(
                            "PROCEED",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.blockHeight * 2.3),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
