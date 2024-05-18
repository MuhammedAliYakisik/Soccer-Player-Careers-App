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
    var s1 = Features("Lionel", "Messi", "photos/messi.png", 38, "Miami FC", "30.00 mil. €",90,"Lionel Andrés Messi (d. 24 Haziran 1987, Rosario), ayrıca Leo Messi olarak da bilinir, Major League Soccer takımlarından Inter Miami'de forma giyen ve Arjantin millî takımının kaptanlığını yapan Arjantinli futbolcudur.");
    var s2 = Features("Erling", "Haaland", "photos/halland.png", 23, "M.City","180.00 mil. €",91,"21 Temmuz 2000; Leeds, İngiltere) Norveçli futbolcu. Premier League takımlarından Manchester City'de forma giymektedir. Genellikle dünyanın en iyi genç futbolcularından biri olarak gösterilen Haaland; üretken bir golcü olan hızı, atletizmi, gücü ve topsuz alandaki hareketliliğiyle dikkat çekmektedir.");
    var s3 = Features("Neymar", "Silva Santos", "photos/neymar.png", 32, "AL Hilal", "45.00 mil. €",88,"Neymar da Silva Santos Júnior ya da bilinen adıyla Neymar 05.02.1992 doğumludur. Forvet ve sol açık mevkilerinde görev yapan Brezilyalı futbolcudur. Şu an La Liga ekiplerinden Barcelona'da 11 numaralı formayı giymektedir. 2009 Campeonato Paulista'da Yılın Genç Futbolcusu ödülünün sahibi olmuştur.");
    var s4 = Features("Cristiano", "Ronaldo", "photos/ronaldo.png", 39, "Al Nassr", "15.00 mil. €",86,"Cristiano Ronaldo dos Santos Aveiro (d. 5 Şubat 1985, Funchal, Madeira), Suudi Profesyonel Ligi takımlarından En-Nasr'da forma giyen ve Portekiz millî takımının kaptanlığını yapan Portekizli futbolcudur.");
    var s5 = Features("Kylian", "Mbappe", "photos/mbappe.png", 25, "PSG", "180.00 mil. €",91,"Kylian Mbappé Lottin (Fransızca telaffuz: [kiljan (ə)mbape]; 20 Aralık 1998, Paris) Fransa millî futbol takımında sol kanat ve santrafor olarak forma giyen Fransız futbolcudur.");
    var s6 = Features("Edinson", "Cavani", "photos/cavani.png", 37, "Boca ", "1.00 mil. €",79,"Edinson Roberto Cavani Gómez (d. 14 Şubat 1987, Salto) Uruguaylı millî futbolcudur. Primera División (Arjantin) ekiplerinden Boca Juniors'da forma giymektedir. Lakabı 'El Matador' dur.");

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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(detail_photo: "${listt.photo}", detail_name: "${listt.name}", detail_surname: "${listt.surname}", detail_career: "${listt.career}")));

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
