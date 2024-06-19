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
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var scoreA = 0;
  var scoreB = 0;
  int rollA = 0;
  int rollB = 0;
  var num = 0;
  var ImageA = "Images/2.jpg";
  var ImageB = "Images/2.jpg";
  var random = Random();
  String resultShow = '';

  void generate() {
    setState(() {
      if (num == 0) {
        rollA = random.nextInt(6) + 1;
        scoreA += rollA;
        ImageA = "Images/${rollA}.jpg";
        num++;
      } else if (num == 1) {
        rollB = random.nextInt(6) + 1;
        scoreB += rollB;
        ImageB = "Images/${rollB}.jpg";
        num--;
      }
    });
    result();
  }

  void result() {
setState(() {
      if (scoreA >= 50) {
      setState(() {
        resultShow = "Result: Team A won. \nReset to play again";
      });
    } else if (scoreB >= 50) {
      setState(() {
        resultShow = "Result: Team B won \nReset to Play again";
      });
    } else {
      setState(() {
        resultShow = "Keep Rolling!";
      });
    }
});
  }
  void reset(){
   setState(() {
      scoreA=0;
    scoreB=0;
    rollA=0;
    rollB=0;
    resultShow = '';
    
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: reset,
      child: Icon(Icons.delete),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Dice Loader",
          style:
              TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Team A",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("Score: $scoreA", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Container(
                        height: 150,
                        child: Image.asset(ImageA),
                      ),
                      SizedBox(height: 8),
                      Text("Roll: $rollA", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Team B",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("Score: $scoreB", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 8),
                      Container(
                        height: 150,
                        child: Image.asset(ImageB),
                      ),
                      SizedBox(height: 8),
                      Text("Roll: $rollB", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: generate,
              child: Text("Roll", style: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              resultShow,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
         
        ],

      ),
    );
  }
}
