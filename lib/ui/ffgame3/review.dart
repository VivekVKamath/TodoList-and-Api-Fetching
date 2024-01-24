// ignore_for_file: non_constant_identifier_names
import 'package:ffgame3/components/config.dart';
import 'package:ffgame3/ui/ffgame3/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/colors.dart';
import 'dart:io';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double _ratingVal = 0.0;
  File? image;
  final formKey3 = GlobalKey<FormState>();
  final pick = ImagePicker();
  bool visible = true;
  bool rate = false;
  double ratedisp = 0.0;
  double sum = 0.0;
  int a = 0;
  int i = 0;
  final List vicky = [];
  Future<void> _openImagePicker() async {
    Navigator.pop(context);
    final XFile? pickedImage =
        await pick.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  Future<void> _openimage_picker() async {
    Navigator.pop(context);
    final XFile? pickedImage = await pick.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  TextEditingController hometextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    IconData? selectedIcon;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: formKey3,
            child: Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockHeight * 3.5,
                  top: SizeConfig.blockHeight * 3.5,
                  right: SizeConfig.blockHeight * 3.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We Would like to know what\ndo you think",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Nunitosans",
                        fontSize: SizeConfig.blockHeight * 3.3,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.blockWidth * 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: Icon(
                          Icons.navigation_sharp,
                          color: Colors.black,
                          size: SizeConfig.blockHeight * 4.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Review & Ratings",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunitosans",
                            fontSize: SizeConfig.blockHeight * 2.7,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth * 1,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: COLORS.black,
                        size: SizeConfig.blockHeight * 3.2,
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth * 1,
                      ),
                      rate
                          ? Text(
                              "${ratedisp.toStringAsFixed(3)}($i)",
                              style: TextStyle(
                                color: COLORS.black,
                                fontFamily: "Nunitosans",
                                fontSize: SizeConfig.blockHeight * 2.3,
                              ),
                            )
                          : Text("${ratedisp.toStringAsFixed(1)}($i)")
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                  RatingBar.builder(
                      updateOnDrag: true,
                      initialRating: _ratingVal,
                      minRating: 1,
                      allowHalfRating: false,
                      itemCount: 5,
                      unratedColor: COLORS.shade,
                      itemSize: SizeConfig.blockHeight * 5.5,
                      itemPadding:
                          EdgeInsets.only(right: SizeConfig.blockWidth * 1),
                      itemBuilder: (context, _) => Icon(
                            selectedIcon ?? Icons.star_rounded,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (value) {
                        setState(() {
                          _ratingVal = value;
                        });
                      }),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                  Text(
                    "Review",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Nunitosans",
                        fontSize: SizeConfig.blockHeight * 2.2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 24,
                    width: SizeConfig.blockWidth * 80,
                    child: TextFormField(
                      controller: hometextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter proper review";
                        } else if (value.length < 4) {
                          return "Enter proper review";
                        } else if (image == null) {
                          return "Please select an image";
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Write your review...",
                          hintStyle: TextStyle(
                              color: COLORS.black,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockHeight * 2,
                              fontFamily: "Nunitosans"),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: COLORS.blueSecondary),
                            borderRadius: BorderRadius.all(
                                Radius.circular(SizeConfig.blockHeight * 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: COLORS.black,
                                  width: SizeConfig.blockHeight * .2),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  SizeConfig.blockHeight * 1)))),
                      maxLines: 100,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 4,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockHeight * 1.3),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: SizeConfig.blockHeight * 16.5,
                              child: Container(
                                  padding: EdgeInsets.all(
                                      SizeConfig.blockHeight * 3),
                                  child: Column(children: [
                                    InkWell(
                                      onTap: _openImagePicker,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.blockHeight * 1,
                                          ),
                                          Icon(
                                            Icons.photo_library,
                                            color: COLORS.black,
                                            size: SizeConfig.blockHeight * 3.5,
                                          ),
                                          SizedBox(
                                            width: SizeConfig.blockHeight * 5,
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.blockHeight *
                                                        2.3),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockHeight * 3.2,
                                    ),
                                    InkWell(
                                        onTap: _openimage_picker,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: SizeConfig.blockHeight * 1,
                                            ),
                                            Icon(
                                              Icons.camera_alt,
                                              color: COLORS.black,
                                              size:
                                                  SizeConfig.blockHeight * 3.5,
                                            ),
                                            SizedBox(
                                              width: SizeConfig.blockHeight * 5,
                                            ),
                                            Text(
                                              "Camera",
                                              style: TextStyle(
                                                  fontSize:
                                                      SizeConfig.blockHeight *
                                                          2.3),
                                            ),
                                          ],
                                        ))
                                  ])),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: SizeConfig.blockHeight * 17,
                        width: SizeConfig.blockHeight * 17,
                        decoration: BoxDecoration(
                            border: Border.all(color: COLORS.blueSecondary),
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockHeight * 1.3)),
                        child: image != null
                            ? Image.file(image!, fit: BoxFit.fill)
                            : Icon(
                                Icons.camera_alt_outlined,
                                color: COLORS.blueSecondary,
                                size: SizeConfig.blockHeight * 5,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 4,
                  ),
                  SizedBox(
                    width: SizeConfig.blockWidth * 32,
                    height: SizeConfig.blockHeight * 5.6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: COLORS.accent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockHeight))),
                      onPressed: () {
                        if (formKey3.currentState!.validate()) {
                          setState(() {
                            vicky.add({
                              "img": image,
                              "text": hometextController.text,
                              "rate": _ratingVal,
                              "a": 0.0
                            });
                            i = i + 1;
                            visible = false;
                            hometextController.clear();
                            image = null;
                            sum = sum + _ratingVal;
                            ratedisp = sum / i;
                            _ratingVal = 0.0;
                          });
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockHeight * 2.5,
                            fontFamily: "Nunitosans",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (vicky.isEmpty)
                          ? Container(
                              height: SizeConfig.blockHeight * 17,
                              width: SizeConfig.blockWidth * 86,
                              decoration: BoxDecoration(
                                border: Border.all(color: COLORS.blueSecondary),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.blockHeight * 1.5)),
                              ),
                              child: Center(
                                child: Text(
                                  "No Review Currently",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockHeight * 2.2,
                                      fontFamily: "Nunitosans",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: vicky.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          SizeConfig.blockHeight * 3),
                                      decoration: BoxDecoration(
                                          color: COLORS.shade,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.blockHeight *
                                                      1.4))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              RotationTransition(
                                                turns: AlwaysStoppedAnimation(
                                                    vicky[index]["a"] / 360),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius
                                                      .all(Radius.circular(
                                                          SizeConfig
                                                                  .blockHeight *
                                                              2)),
                                                  child: SizedBox(
                                                      height: SizeConfig
                                                              .blockHeight *
                                                          11,
                                                      width: SizeConfig
                                                              .blockWidth *
                                                          20,
                                                      child: vicky[index]
                                                                  ["img"] !=
                                                              null
                                                          ? Image.file(
                                                              vicky[index]
                                                                  ["img"]!,
                                                              fit: BoxFit.fill)
                                                          : null),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: SizeConfig.blockWidth *
                                                      2),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Rohith",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: SizeConfig
                                                              .blockHeight *
                                                          2.8,
                                                      fontFamily: "Nunitosans",
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star_rounded,
                                                        color: COLORS.blueShade,
                                                        size: SizeConfig
                                                                .blockHeight *
                                                            2.6,
                                                      ),
                                                      SizedBox(
                                                        width: SizeConfig
                                                            .blockWidth,
                                                      ),
                                                      Text(
                                                        "${vicky[index]["rate"]} Ratings",
                                                        style: TextStyle(
                                                            color: COLORS
                                                                .blueShade,
                                                            fontSize: SizeConfig
                                                                    .blockHeight *
                                                                2.1,
                                                            fontFamily:
                                                                "Nunitosans",
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                  width: SizeConfig.blockWidth *
                                                      22),
                                              Column(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          vicky[index]["a"] =
                                                              vicky[index]
                                                                      ["a"] +
                                                                  15;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.crop_rotate,
                                                        color: COLORS.black,
                                                        size: SizeConfig
                                                                .blockHeight *
                                                            4,
                                                      )),
                                                  SizedBox(
                                                    height:
                                                        SizeConfig.blockHeight *
                                                            3,
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          i = i - 1;
                                                          sum = sum -
                                                              vicky[index]
                                                                  ["rate"];
                                                          ratedisp = sum / i;
                                                          if (i == 0) {
                                                            visible = true;
                                                            ratedisp = 0.0;
                                                          }
                                                          vicky.removeAt(index);
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: COLORS.black,
                                                        size: SizeConfig
                                                                .blockHeight *
                                                            4,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: SizeConfig.blockHeight * 4,
                                          ),
                                          Text(
                                            vicky[index]["text"],
                                            style: TextStyle(
                                                color: COLORS.black,
                                                fontSize:
                                                    SizeConfig.blockHeight *
                                                        2.1,
                                                fontFamily: "Nunitosans",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.blockHeight * 2,
                                    ),
                                  ],
                                );
                              })
                    ],
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
