import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import '../main.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final c = Get.put(Controller());
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text("Computer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        const SizedBox(height: 20,),
                        Obx(()=>Text("${c.compPoints.value}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))
                      ],
                    ),

                    const SizedBox(width: 50,),

                    Column(
                      children: [
                        Obx(()=>Text(c.name.value,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                        const SizedBox(height: 20,),
                        Obx(()=>Text("${c.playerPoints.value}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)))
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20,),

                Obx(()=>Text("Your Choice: ${c.value.value}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),

                const SizedBox(height: 20,),

                Obx(() => Text("Computers Choice : ${c.pcChoice.value}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),

                const SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: (){c.value.value--;},
                      child: const Text("-") ,
                    ),

                    const SizedBox(width: 20,),

                    Obx(()=>Text("${c.value.value}")),

                    const SizedBox(width: 20,),

                    ElevatedButton(
                      onPressed: (){c.value.value++;},
                      child: const Text("+") ,
                    ),
                  ],
                ),

                const SizedBox(height: 30,),

                ElevatedButton(
                    onPressed: (){
                      if(c.compPoints.value>=c.points.value ||  c.playerPoints.value>= c.points.value) {
                        if(c.playerPoints.value > c.compPoints.value){
                          c.winner.value = "You Win";
                        }
                        else{
                          c.winner.value = "You Lose";
                        }
                        Get.toNamed('/results');
                      } else {
                        Random random = Random();
                        var pc = random.nextInt(10);
                        c.pcChoice.value = pc;

                        if(pc%2 == c.value.value%2){
                          c.playerPoints++;
                        }
                        else{
                          c.compPoints.value++;
                        }
                      }
                    },
                    child: const Text("Play")),
              ],
            ),
          ),
        )
    );
  }
}
