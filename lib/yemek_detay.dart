import 'package:flutter/material.dart';
import 'package:yemekuygulamasi/yemekler.dart';

class YemekDetay extends StatefulWidget {

  Yemekler yemek;
   YemekDetay({required this.yemek});

  @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 83, 64, 255),
      title: Text(widget.yemek.yemek_adi , style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/${widget.yemek.yemek_resim_adi}"),
            Text("${widget.yemek.yemek_fiyat} \u{20BA}", style: TextStyle(fontSize: 20 , color:Color.fromARGB(255, 83, 64, 255)),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(onPressed: (){
                print("${widget.yemek.yemek_adi} sipariş verildi");
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 83, 64, 255),
                
              ),
              child:const Text("Sipariş Ver" , style: 
              TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}