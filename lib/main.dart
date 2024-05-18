import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:soccer_player_careers/Detail.dart';
import 'package:soccer_player_careers/Features.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Features>> showFeatures() async {
    var list = <Features>[];
    var s1 = Features("Lionel", "Messi", "photos/messi.png", 38, "Miami FC", "30.00 mil. €",90);
    var s2 = Features("Erling", "Haaland", "photos/halland.png", 23, "M.City","180.00 mil. €",91);
    var s3 = Features("Neymar", "Silva Santos", "photos/neymar.png", 32, "AL Hilal", "45.00 mil. €",88);
    var s4 = Features("Cristiano", "Ronaldo", "photos/ronaldo.png", 39, "Al Nassr", "15.00 mil. €",86);
    var s5 = Features("Kylian", "Mbappe", "photos/mbappe.png", 25, "PSG", "180.00 mil. €",91);
    var s6 = Features("Edinson", "Cavani", "photos/cavani.png", 37, "Boca ", "1.00 mil. €",79);

    list.add(s1);
    list.add(s2);
    list.add(s3);
    list.add(s4);
    list.add(s5);
    list.add(s6);

    return list ;
  }


  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    var ekranyukseklik = ekranbilgisi.size.height;
    var ekrangenislik = ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Futbol Oyuncuları",style: TextStyle(fontWeight: FontWeight.bold),),
        leading: Icon(Icons.sports_soccer_outlined),
      ),
      body: FutureBuilder<List<Features>>(
        future: showFeatures(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var list = snapshot.data;

            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context,indeks){
                var listt = list[indeks];

                return SizedBox(width: ekrangenislik/50,height: ekranyukseklik/5,
                  child: GestureDetector(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail()));

                  },
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(width: ekrangenislik/3,height: ekranyukseklik/6,child: Image.asset("${listt.photo}")),
                          Column(
                            children: [
                              Text("${listt.name}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                              Text("${listt.surname}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                              Padding(
                                padding:  EdgeInsets.only(top: ekranyukseklik/100),
                                child: Text("Takım: ${listt.team}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                              ),
                              Text("Değer: ${listt.value}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),



                            ],

                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top: ekranyukseklik/100,left: ekrangenislik/90),
                                  child: Text("Yaş: ${listt.age}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                ),


                                Padding(
                                  padding:  EdgeInsets.only(top: ekranyukseklik/40,left: ekrangenislik/20),
                                  child: CircularPercentIndicator(radius: 40,backgroundColor: Colors.blue,center: Text("${listt.reyting}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
                                )


                              ],


                            )
                          )

                        ],
                      ),
                    ),
                  ),
                );

              }
            );
          }else{
            return Center();
          }

        }
      ),
    );
  }
}
