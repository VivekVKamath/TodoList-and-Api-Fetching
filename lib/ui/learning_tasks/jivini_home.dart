import 'package:ffgame3/components/config.dart';
import '../../components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class JiviniHome extends StatefulWidget {
  const JiviniHome({Key? key}) : super(key: key);
  @override
  State<JiviniHome> createState() => _JiviniHomeState();
}

class _JiviniHomeState extends State<JiviniHome> {
  final List<Map<String,dynamic>>   vicky = [
    {
      "I1":"assets/images/JLo.jpeg",
      "T1":"Vendor name\ngoes here"
    },
    {
      "I1":"assets/images/JLo.jpeg",
      "T1":"Vendor name\ngoes here"
    },
    {
      "I1":"assets/images/JLo.jpeg",
      "T1":"Vendor name\ngoes here"
    }
  ];
  final List<Map<String,dynamic>>   vicky2 = [
    {
      "V1":"Vendor name goes here",
      "V2":"04 Sep 2022, 7:30 PM",
      "V3":"DR3732",
      "V4":"Ordered By",
      "V5":"Cardiac",
      "V6":"Distributor",
      "V7":"AK Pharma",
      "V8":"Status :",
      "V9":"Approved",
      "C1":COLORS.accentLight,
      "C2": COLORS.accentDark,
      "C3":COLORS.accentDark,
      "Val1": 1.0
    },
    {
      "V1":"Vendor name goes here",
      "V2":"04 Sep 2022, 7:30 PM",
      "V3":"DR3732",
      "V4":"Ordered By",
      "V5":"Cardiac",
      "V6":"Distributor",
      "V7":"AK Pharma",
      "V8":"Status :",
      "V9":"Approval Failed at level 4",
      "C1": COLORS.redLight,
      "C2": Colors.redAccent,
      "C3": Colors.redAccent,
      "Val1": 0.4
    },
    {
      "V1":"Vendor name goes here",
      "V2":"04 Sep 2022, 7:30 PM",
      "V3":"DR3732",
      "V4":"Ordered By",
      "V5":"Cardiac",
      "V6":"Distributor",
      "V7":"AK Pharma",
      "V8":"Status :",
      "V9":"Approval level 7/11",
      "C1": COLORS.blueSecondary,
      "C2": Colors.purple,
      "C3": Colors.purple,
      "Val1": 0.75
    },
    {
      "V1":"Vendor name goes here",
      "V2":"04 Sep 2022, 7:30 PM",
      "V3":"DR3732",
      "V4":"Ordered By",
      "V5":"Cardiac",
      "V6":"Distributor",
      "V7":"AK Pharma",
      "V8":"Status :",
      "V9":"Fully Approved",
      "C1":Colors.greenAccent,
      "C2":Colors.green.shade900,
      "C3":Colors.green.shade900,
      "Val1": 1.0
    },
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: COLORS.shade,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){},
          child: ImageIcon(
            const AssetImage("assets/images/menu-fill.png"),
            color: Colors.black,
            size:  SizeConfig.blockHeight*8,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockWidth*10,
                top: SizeConfig.blockHeight*2.5,
                bottom: SizeConfig.blockHeight*2.5,
               // right: SizeConfig.blockWidth
            ),
            child: SizedBox(
              height: SizeConfig.blockHeight,
              width: SizeConfig.blockWidth*10,
              child: Image.asset(
                "assets/images/JLo.jpeg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: SizeConfig.blockWidth,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:EdgeInsets.only(
                    right: SizeConfig.blockWidth*11,
                ),
                child: Text("Jivini",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockHeight*3.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: "NunitoSans"
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: SizeConfig.blockWidth*15,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("DR3732",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "NunitoSans",
                    fontSize: SizeConfig.blockHeight*3,
                    fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
          SizedBox(width: SizeConfig.blockWidth,),

          ///Icon
          InkWell(
            onTap: (){},
            child: ImageIcon(
              const AssetImage(
                  "assets/images/notification-3-fill.png"
              ),
              color: COLORS.accentDark,
              size: SizeConfig.blockHeight*8,
            ),
          ),
          SizedBox(width: SizeConfig.blockWidth*2,),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical:SizeConfig.blockHeight*3,
                horizontal:SizeConfig.blockHeight*2,
            ),
            child: Column(
              children: [

                ///Image slideshow
                ImageSlideshow(
                  height: SizeConfig.blockHeight*25,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.blockWidth*5
                        ),
                        child: Image.network(
                          "https://media.licdn.com/dms/image/D4D16AQHqXAjDV8S0KA/profile-displaybackgroundimage-shrink_200_800/0/1670553461629?e=2147483647&v=beta&t=b56C1TA0nSRD94naQ3-Ehfm6bIyFFOVoLaRHqgWjEP0",
                          fit: BoxFit.fill,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockWidth*5
                        ),
                        child: Image.network(
                          "https://www.moonastro.com/babyname/baby%20Jivini.jpg"
                          ,fit: BoxFit.fill,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockWidth*5
                        ),
                        child: Image.network(
                          "https://images.drlogy.com/assets/uploads/img/user/baby-names/meaning/jivini-name-meaning-51051.webp",
                          fit: BoxFit.fill,
                        ),
                      ),
                ]
                ),
                SizedBox(height: SizeConfig.blockHeight*3,),

                ///Vendors and View All
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Vendors",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: SizeConfig.blockHeight*3,
                        fontFamily: "NunitoSans"
                    ),
                    ),
                    const Text("View All",
                      style: TextStyle(
                          color: COLORS.accentDark,
                          fontWeight: FontWeight.w900,
                          fontFamily: "NunitoSans"
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.blockHeight*2,),

                ///ListViewbuilder1
                SizedBox(
                  height: SizeConfig.blockHeight*20,
                  width: SizeConfig.blockWidth*100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: vicky.length,
                      itemBuilder: (BuildContext context,int index)
                      {
                        return Container(
                          width: SizeConfig.blockWidth*35,
                          height: SizeConfig.blockHeight*13,
                          padding: EdgeInsets.only(top: SizeConfig.blockHeight*3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(SizeConfig.blockHeight*3.5)
                          ),
                          margin: EdgeInsets.symmetric(horizontal:SizeConfig.blockWidth),
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                    "${vicky[index]['I1']}",
                                  height: SizeConfig.blockHeight*10,
                                  width: SizeConfig.blockWidth*12,
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockHeight,),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.blockWidth,
                                ),
                                child: Text(
                                  "${vicky[index]['T1']}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                      fontFamily: "NunitoSans",
                                    fontSize: SizeConfig.blockHeight*2
                                  ),
                                  ),
                              ),

                            ],
                          ),
                        );
                      }
                  ),
                ),
                SizedBox(height: SizeConfig.blockHeight*4,),

                ///Recent Orders and View All
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Orders",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: SizeConfig.blockHeight*3,
                          fontFamily: "NunitoSans"
                      ),
                    ),
                    const Text("View All",
                      style: TextStyle(
                          color: COLORS.accentDark,
                          fontWeight: FontWeight.w900,
                          fontFamily: "NunitoSans"
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.blockHeight*2,),

                ///ListViewBuilder2
                SizedBox(
                  width: SizeConfig.blockWidth*100,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: vicky2.length,
                      itemBuilder: (BuildContext context,int index)
                      {
                        return Container(
                          height: SizeConfig.blockHeight*30,
                          padding: EdgeInsets.only(
                              top: SizeConfig.blockHeight*2,
                              bottom: SizeConfig.blockHeight*2,
                              left: SizeConfig.blockWidth*4.5
                          ),
                          margin: EdgeInsets.only(top: SizeConfig.blockHeight*2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(SizeConfig.blockHeight)
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${vicky2[index]["V1"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "NunitoSans",
                                      fontSize: SizeConfig.blockHeight*3
                                    ),
                                  ),
                                  Text(
                                      "${vicky2[index]["V2"]}",
                                      style: TextStyle(
                                        fontFamily: "NunitoSans",
                                        fontSize: SizeConfig.blockHeight*1.5,
                                      ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${vicky2[index]["V3"]}",
                                    style: const TextStyle(
                                        fontFamily: "NunitoSans"
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConfig.blockHeight*3,),
                              Row(
                                children: [
                                  Text(
                                    "${vicky2[index]["V4"]}",
                                    style: const TextStyle(
                                        color: COLORS.blackLight,
                                        fontFamily: "NunitoSans",
                                    ),
                                  ),
                                  SizedBox(width: SizeConfig.blockWidth*7,),
                                  Text(
                                      "${vicky2[index]["V5"]}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                          fontFamily: "NunitoSans"
                                      ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      "${vicky2[index]["V6"]}",
                                      style: const TextStyle(
                                        color: COLORS.blackLight,
                                          fontFamily: "NunitoSans"
                                      ),
                                  ),
                                  SizedBox(width: SizeConfig.blockWidth*7.5,),
                                  Text(
                                    "${vicky2[index]["V7"]}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                        fontFamily: "NunitoSans"
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.blockHeight*2,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: SizeConfig.blockHeight*9,
                                    width: SizeConfig.blockWidth*87,
                                    padding: EdgeInsets.only(top: SizeConfig.blockHeight),
                                    decoration: BoxDecoration(
                                        color: vicky2[index]["C1"],
                                        borderRadius: BorderRadius.circular(SizeConfig.blockHeight)
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: SizeConfig.blockWidth),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${vicky2[index]["V8"]}",
                                                style: const TextStyle(
                                                    color: COLORS.blackLight
                                                ),
                                              ),
                                              SizedBox(width: SizeConfig.blockWidth,),
                                              Text("${vicky2[index]["V9"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold ,
                                                color: vicky2[index]["C3"]
                                              ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig.blockWidth,
                                              vertical: SizeConfig.blockHeight*2
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(SizeConfig.blockHeight),
                                            child: LinearProgressIndicator(
                                              value: vicky2[index]["Val1"],
                                              minHeight: 8,
                                              color: vicky2[index]["C2"],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
