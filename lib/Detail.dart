import 'package:flutter/material.dart';

class Detail extends StatelessWidget {


  String detail_photo;
  String detail_name;
  String detail_surname;
  String detail_career;

  Detail({required this.detail_photo,required this.detail_name,required this.detail_surname,required this.detail_career});

  //const Detail({super.key});



  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    var ekranyukseklik = ekranbilgisi.size.height;
    var ekrangenisligi = ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Detail",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding:  EdgeInsets.all(8.0),
              child: SizedBox(width:ekrangenisligi/2,height: ekranyukseklik/3,child: Image.asset(detail_photo)),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$detail_name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ekranyukseklik/20),),
                SizedBox(width: 20,),
                Text("$detail_surname",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ekranyukseklik/20)),

              ],
            ),

            Padding(
              padding:  EdgeInsets.only(top: ekranyukseklik/50),
              child: Text("$detail_career",style: TextStyle(fontWeight: FontWeight.bold,fontSize: ekranyukseklik/30),),
            )

          ],
        ),

      ),
    );
  }
}
