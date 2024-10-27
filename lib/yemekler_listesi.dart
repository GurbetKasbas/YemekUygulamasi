import 'package:flutter/material.dart';
import 'package:yemekuygulamasi/yemek_detay.dart';
import 'package:yemekuygulamasi/yemekler.dart';

class YemeklerSayfasi extends StatefulWidget {
  const YemeklerSayfasi({super.key});

  @override
  State<YemeklerSayfasi> createState() => _YemeklerSayfasiState();
}

class _YemeklerSayfasiState extends State<YemeklerSayfasi> {

Future<List<Yemekler>> yemekleriGetir() async{
  var yemekListesi = <Yemekler>[];//Yemekler sınıfından nesneler tutan bir liste oluşturduk

//Yemekler sınıfından nesneler oluşturduk
  var y1 = Yemekler(yemek_id: 1, yemek_adi: "Köfte", yemek_resim_adi: "kofte.png", yemek_fiyat: 399.99);
  var y2 = Yemekler(yemek_id: 2, yemek_adi: "Ayran", yemek_resim_adi: "ayran.png", yemek_fiyat: 29.99);
  var y3 = Yemekler(yemek_id: 3, yemek_adi: "Fanta", yemek_resim_adi: "fanta.png", yemek_fiyat: 79.99);
  var y4 = Yemekler(yemek_id: 4, yemek_adi: "Makarna", yemek_resim_adi: "makarna.png", yemek_fiyat: 199.99);
  var y5 = Yemekler(yemek_id: 5, yemek_adi: "Kadayıf", yemek_resim_adi: "kadayif.png", yemek_fiyat: 299.99);
  var y6 = Yemekler(yemek_id: 1, yemek_adi: "Baklava", yemek_resim_adi: "baklava.png", yemek_fiyat: 299.99);
  
  //Olusturuduğumuz nesneleri yemek listesine ekledık
  yemekListesi.add(y1);
  yemekListesi.add(y2);
  yemekListesi.add(y3);
  yemekListesi.add(y4);
  yemekListesi.add(y5);
  yemekListesi.add(y6);

  return yemekListesi;
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 30, 235, 136), title: const Text("Yemekler" , style: TextStyle(color: Colors.white),),),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(), //Çağıracağımız methodun adı
        builder: (context,snapshot){
          if(snapshot.hasData){
            //Eğer bilgi gelsiyse snapshot ile alınan bilgiyi bir listede tutuyorum
            var gelenYemekListesi = snapshot.data;

            return ListView.builder(
              itemCount: gelenYemekListesi!.length,
              itemBuilder: (context,index){
                var yemek = gelenYemekListesi[index];//Sırayla gelen nesneleri yemek değişkeninde tutar

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetay(yemek: gelenYemekListesi[index],)));
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 83, 64, 255),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            
                            child: Image.asset("assets/images/${yemek.yemek_resim_adi}")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(yemek.yemek_adi , style: TextStyle(fontSize: 20 , color: Colors.white),),
                            SizedBox(height: 50,),
                            Text("${yemek.yemek_fiyat} \u{20BA}", style: TextStyle(fontSize: 20 , color: Colors.white),),
                          
                          ],),
                          Spacer(),
                          Icon(Icons.arrow_right_outlined , color: Colors.white,)
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