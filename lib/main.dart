import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './Pages/Home.dart';
import './Pages/Game.dart';
import './Pages/Results.dart';

class Controller extends GetxController{
  var name = "".obs;
  var points = 0.obs;
  var compPoints=0.obs;
  var playerPoints = 0.obs;
  var value = 0.obs;
  var pcChoice = 0.obs;
  var winner = "".obs;
}

void main() {
  runApp(GetMaterialApp(
    unknownRoute: GetPage(name: '/notFound', page: () {return const Text("Child not found");}),
    initialRoute: '/',
    getPages: [
      GetPage(name: '/home', page: ()=>const Home()),
      GetPage(name: '/game', page: ()=>const Game()),
      GetPage(name: '/results', page:()=> const Results()),
    ],
    //home: const Home(),
  ));
}

//hello nothing
