import 'package:flutter/material.dart';
import 'package:mems_app/fetch_meme.dart';
import 'package:mems_app/savemydata.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imageUrl="";
  int? memeNO;
  bool isLoading= true;
  int targetMeme= 100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNO();
    UpdateImg();
  }
  void UpdateImg() async{
    String getImageUrl =await FetchMeme.fetchNewMeme();
    setState(() {
      imageUrl=getImageUrl;
      isLoading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
            ),
            Text(
              "Memes # ${memeNO.toString()}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Target ${targetMeme} Memes',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
             isLoading ?
            Container(
                height : 400,
                width : MediaQuery.of(context).size.width,
                child : Center(
                    child : SizedBox(
                        height : 60,
                        width : 60,
                        child: CircularProgressIndicator())
                )
            )
                :
            Image.network(
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
             imageUrl,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Container(
                height: 40,
                width: 70,
                child: Center(
                    child: Text(
                  'More Fun',
                  style: TextStyle(fontSize: 15),
                )),
              ),
              onPressed: () async{
                await SaveMyData.saveData(memeNO!+1);
                GetInitMemeNO();
                UpdateImg();
              },
            ),
            Spacer(),
            Text(
              'App Author',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Engr.Umrahzadi Abbasi',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
  
   GetInitMemeNO() async{
    memeNO= await SaveMyData.fetchData() ?? 0;
    if(memeNO!>100){
       targetMeme= 500;
    }else if(memeNO!>500){
      targetMeme=1000;
    }
    setState(() {
      
    });
   }
}
