import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const ImageLode());
}

class ImageLode extends StatelessWidget {
  const ImageLode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dice",
      home: homepage(),
    );
  }
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var random =Random();
   int choice =1;
   void generate()
   {
    setState(() {
        choice = random.nextInt(6)+1;
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(146, 158, 107, 5),
        title: const Text(
          "Dice loder",
          style:
              TextStyle(color: Color.fromARGB(255, 215, 131, 3), fontSize: 30),
        ),
        centerTitle: true,
      ),
     body: Column(
      children: [
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset('Images/$choice.jpg'),
                decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.black)),
              ),
            ],
          ),
        
          ElevatedButton(onPressed: generate, child: Text("Roll")),
      ],
     ),  
    );
  }
}
