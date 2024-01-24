import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ffgame3/components/config.dart';
import 'package:ffgame3/components/colors.dart';
Widget textfrom ({required String hint,required String text}){
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: SizeConfig.blockHeight*14,
          width: SizeConfig.blockWidth*85,
          child: TextFormField(
            cursorColor: COLORS.black,
            autofocus: false,
            keyboardType: TextInputType.text,
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
      ],
    ),
  );
}