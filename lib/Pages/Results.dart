import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final c = Get.put(Controller());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" Your Score ${c.playerPoints}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              const SizedBox(height: 40,),
              Text(c.winner.value,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ElevatedButton(onPressed: (){Get.toNamed('/');}, child: const Text("Home"))
            ],
          ),
        ),
      ),
    );
  }
}
