import 'package:ffgame3/components/colors.dart';
import 'package:ffgame3/components/config.dart';
import 'package:ffgame3/services/remote_service.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import '../../models/photos.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Photos> ? photos;
  var isLoaded = false;
  @override
  void initState(){
    super.initState();
    getData();
  }
  getData() async{
    photos = await RemoteService().getPhotos();
    if(photos!=null){
      setState(() {
        isLoaded=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: isLoaded,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
            itemCount: photos?.length,
              itemBuilder: (context, index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.blockHeight),
                  border: Border.all(width: SizeConfig.blockWidth*1.5,
                      color: COLORS.whiteSplash
                  )
              ),
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight*3,
                  horizontal: SizeConfig.blockWidth*6
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///ID
                  Text(
                    photos![index].id.toString(),style: const TextStyle(
                    fontFamily: "NunitoSans",
                  ),
                  ),

                  ///Text
                  Text(
                    "${photos![index].title}",style: const TextStyle(
                    fontFamily: "NunitoSans",
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: SizeConfig.blockHeight,),

                  ///Url
                  Image.network("${photos![index].url}"),
                  SizedBox(height: SizeConfig.blockHeight*2,),

                  ///Uri
                  Image.network("${photos![index].thumbnailUrl}")
                ],
              ),
            );
          }
          ),
        ),
      ),
    );
  }
}
