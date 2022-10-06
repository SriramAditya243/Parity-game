import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Controller c = Get.put(Controller());
    final textController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                    "ODD - EVEN",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20,),

                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Enter your name"
                  ),
                ),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: (){c.points.value--;},
                      child: const Text("-") ,
                    ),

                    const SizedBox(width: 20,),

                    Obx(()=>Text("${c.points.value}")),

                    const SizedBox(width: 20,),

                    ElevatedButton(
                      onPressed: (){c.points.value++;},
                      child: const Text("+") ,
                    ),
                  ],
                ),

                const SizedBox(height: 30,),

                ElevatedButton(
                    onPressed: (){
                      c.name.value = textController.text;
                      Get.toNamed('/game');
                    },
                    child: const Text("Play")),
              ],
            ),
        ),
      )
    );
  }
}
