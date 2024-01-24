import 'package:ffgame3/components/colors.dart';
import 'package:ffgame3/components/config.dart';
import 'package:flutter/material.dart';
class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  var buttonblue = COLORS.blueSecondary;
  bool isLoading= false;
  bool isnotLoading=false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockHeight*3,
                  horizontal: SizeConfig.blockWidth*8
              ),
              child: Column(
                children: [

                  ///Logout
                  InkWell(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Logout",
                          style: TextStyle(
                              color: COLORS.accentDark,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockHeight*2.5
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockWidth,),
                        ImageIcon(const AssetImage("assets/images/logout jivini.png"),
                          color: COLORS.accentDark,
                          size: SizeConfig.blockHeight*2.5,
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight*7,),

                  ///Basic Doctor Details
                  Row(
                    children: [
                      Text("Basic Doctor Details",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockHeight*3.8
                      ),
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.blockHeight,),

                  ///Logout Subtext
                  Row(
                    children: [
                      Text("Kindly provide your details with us.",
                        style: TextStyle(
                            fontSize: SizeConfig.blockHeight*2,
                            color: COLORS.blackLight,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: SizeConfig.blockHeight*6.5,),

                  ///Name
                  Row(
                    children: const [Text("Name",style: TextStyle(
                        fontWeight:FontWeight.w800,
                        fontFamily: "NunitoSans"
                    ),
                    )
                    ],
                  ),

                  SizedBox(height: SizeConfig.blockHeight,),

                  ///TFF for Name
                  SizedBox(
                    height: SizeConfig.blockHeight * 10,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          if (value==value) {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                            isLoading = false;
                          } else if (controller.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                            isnotLoading = true;
                            isLoading = false;
                          }else {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                          }
                        }
                        );
                      },
                      maxLines: 1,
                      cursorColor: COLORS.black,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      controller: controller,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth*4),
                          child: const Text("DR.",
                            style: TextStyle(
                                color: COLORS.accent,
                                fontWeight: FontWeight.bold,
                                fontFamily: "NunitoSans"
                            ),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 40,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight*2,
                            horizontal: SizeConfig.blockWidth*4
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.blueSecondary,
                              width: SizeConfig.blockHeight * .2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .1
                          ),
                        ),
                        hintText: "Enter your Name",
                        hintStyle: TextStyle(
                            color: COLORS.blackLight,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1
                            )
                        ),
                      ),
                      validator: (value) {
                        if (value!.contains(" ")) {
                          return "Please Enter correct name";
                        }else if (value.isEmpty) {
                          return "Please Enter correct name";
                        }else if(!RegExp(r"^[a-zA-Z]+$").hasMatch(value))
                        {
                          return "Please Enter correct name";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight*3,),

                  ///Qualification(Highest Qualification)
                  Row(
                    children: const [
                        Text("Qualification",
                         style: TextStyle(
                             fontWeight: FontWeight.bold),
                       ),
                        Text("(Highest Qualification)",
                         style: TextStyle(
                         ),
                       )
                     ],
                   ),
                   SizedBox(height: SizeConfig.blockHeight,),

                  ///TFF for qualification
                  SizedBox(
                    height: SizeConfig.blockHeight*10,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          if (value==value) {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                            isLoading = false;
                          } else if (controller1.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                            isnotLoading = true;
                            isLoading = false;
                          }else {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                          }
                        }
                        );
                      },
                      maxLines: 1,
                      cursorColor: COLORS.black,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      controller: controller1,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight,
                            horizontal: SizeConfig.blockWidth*4
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.blueSecondary,
                              width: SizeConfig.blockHeight * .2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .1
                          ),
                        ),
                        hintText: "Enter your qualification",
                        hintStyle: TextStyle(
                            color: COLORS.blackLight,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1
                            )
                        ),
                      ),
                      validator: (value) {
                        if (value!.contains(" ")) {
                          return "Please Enter correct name";
                        }else if (value.isEmpty) {
                          return "Please Enter correct name";
                        }else if(!RegExp(r"^[a-zA-Z]+$").hasMatch(value))
                        {
                          return "Please Enter correct name";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight*3,),

                  /// Medical Council Registration Number
                  Row(
                    children: const [
                       Text("Medical Council Registration Number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight,),

                  ///TFF for Medical Council Registration Number
                  SizedBox(
                    height: SizeConfig.blockHeight*10,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          if (value==value) {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                            isLoading = false;
                          } else if (controller2.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                            isnotLoading = true;
                            isLoading = false;
                          }else {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                          }
                        }
                        );
                      },
                      maxLines: 1,
                      cursorColor: COLORS.black,
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      controller: controller2,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight,
                            horizontal: SizeConfig.blockWidth*4
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.blueSecondary,
                              width: SizeConfig.blockHeight * .2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .1
                          ),
                        ),
                        hintText: "Enter your medical council registration number",
                        hintStyle: TextStyle(
                            color: COLORS.blackLight,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1
                            )
                        ),
                      ),
                      validator: (value) {
                        if (value!.contains(" ")) {
                          return "Please Enter correct name";
                        }else if (value.isEmpty) {
                          return "Please Enter correct name";
                        }else if(!RegExp(r'^[a-zA-Z0-9&%=]+$').hasMatch(value))
                        {
                          return "Please Enter correct name";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight*3,),
                  ///Specialization
                  Row(
                    children: const[
                       Text("Specialization",
                        style: TextStyle(
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  SizedBox(height: SizeConfig.blockHeight,),

                  ///TFF for Specialization
                  SizedBox(
                    height: SizeConfig.blockHeight*10,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          if (value==value) {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                            isLoading = false;
                          } else if (controller3.text.isEmpty) {
                            buttonblue = COLORS.blueSecondary;
                            isnotLoading = true;
                            isLoading = false;
                          }else {
                            buttonblue = COLORS.accent;
                            isnotLoading = false;
                          }
                        }
                        );
                      },
                      cursorColor: COLORS.black,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      controller: controller3,
                      style: TextStyle(
                        fontSize: SizeConfig.blockHeight * 2.4,
                        color: COLORS.black,
                        fontFamily: "Nunitosans",
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockHeight*2.5,
                            horizontal: SizeConfig.blockWidth*5
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.blueSecondary,
                              width: SizeConfig.blockHeight * .2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  SizeConfig.blockHeight * 1
                              )
                          ),
                          borderSide: BorderSide(
                              color: COLORS.black,
                              width: SizeConfig.blockHeight * .1
                          ),
                        ),
                        hintText: "Enter your specialization",
                        hintStyle: TextStyle(
                            color: COLORS.blackLight,
                            fontSize: SizeConfig.blockHeight * 2,
                            fontFamily: "Nunitosans"
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1
                            )
                        ),
                      ),
                      validator: (value) {
                        if (value!.contains(" ")) {
                          return "Please Enter correct specialization";
                        }else if (value.isEmpty) {
                          return "Please Enter correct specialization";
                        }else if(!RegExp(r'^[a-z A-Z]+$').hasMatch(value))
                        {
                          return "Please Enter correct specialization";
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight*13,),

                  ///Elevated Button NEXT
                  ElevatedButton(
                      onPressed: (){ isnotLoading? null:
                        formKey.currentState!.validate();
                        setState(() {
                          isLoading=false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonblue,
                          fixedSize: Size(
                              SizeConfig.blockWidth*100,
                              SizeConfig.blockHeight*7
                          )
                      ),
                      child: const Text("NEXT")
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
