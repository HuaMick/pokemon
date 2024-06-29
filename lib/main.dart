import 'package:flutter/material.dart';
import 'package:pokemon/button.dart';
import 'package:pokemon/characters/boy.dart';
import 'package:pokemon/maps/littleroot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // littleroot
  double mapX = 0;
  double mapY = 0;

  // boy character
  int boySpriteCount = 0;
  String boyDirection = 'Down';

  // game stuff
  String currentLocation = 'littleroot';

  void moveDown(){
    boyDirection = 'Down';
    setState(() {
      mapY -= 0.2;
    });
  }
  void moveUp(){
    boyDirection = 'Up';
    setState(() {
      mapY += 0.2;
    });
  }
  void moveLeft(){
    boyDirection = 'Left';
    setState(() {
      mapX += 0.2;
    });
  }
  void moveRight(){
    boyDirection = 'Right';
    setState(() {
      mapX -= 0.2;
    });
  }
  void pressedA(){
    print('A');
  }
  void pressedB(){
    print('B');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  // littleroot
                  LittleRoot(
                    x: mapX, 
                    y: mapY, 
                    currentMap: currentLocation),
                
                 // character boy
                 Container(
                  alignment: const Alignment(0,0),
                  child: MyBoy(
                    location: currentLocation,
                    boySpriteCount: boySpriteCount,
                    direction: boyDirection,
                  ),
                 )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'G A M E B O Y', 
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),
                                    MyButton(
                                      text: '←',
                                      function: moveLeft,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),                                                                        
                                  ],
                                ),
                                Column(
                                  children: [
                                    MyButton(
                                      text: '↑',
                                      function: moveUp,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),
                                    MyButton(
                                      text: '↓',
                                      function: moveDown,
                                    ),                                                                        
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),
                                    MyButton(
                                      text: '→',
                                      function: moveRight,
                                    ),
                                    const SizedBox(
                                      height: 50,
                                      width: 50,
                                    ),                                                                        
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                              ]
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                              ]
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'C R E A T E D B Y R I C E B O Y',
                      style: TextStyle(color: Colors.white)
                      ),
                  ],
                )
              ),
            ),
          ),
      ],)
    );
  }
}