import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('DICEONE'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int dleft = 1;
  int dright = 1;
  String total = '';
  int sleft = 0;
  int sright = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0
              ),
              child: Text(
                'Score: ' + '$sleft', style: const TextStyle(
                fontSize: 25.0,
              ),
              ),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0
              ),
              child: Text(
                'Score: ' + '$sright', style: const TextStyle(
                fontSize: 25.0,
              ),
              ),
            ))
          ],
        ),
        Center(
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        stful();
                        totals();

                      });
                    },
                    child: Image.asset('images/dice$dleft.png')),
              )),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                          stful();
                          totals();
                        });
                      },
                      child: Image.asset('images/dice$dright.png'))
              )),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [Text(
                '$total',
                style: TextStyle(
                    fontSize: 25.0
                )
            )],
          ),
        ),
        Center(
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        Reset();
                      });
                    },
                    child: Image.asset('images/D.png')),
              )),
            ],
          ),
        ),
      ],
    );

  }
  void stful(){
    dright = 1 + Random().nextInt(6);
    dleft = 1 + Random().nextInt(6);
  }
  void totals(){
    if(dleft > dright){
      total = 'Left DICE WINS!!!';
      sleft += 1;
    }else if(dleft < dright){
      total = 'Right DICE WINS!!!';
      sright += 1;;
    }else{
      total = 'Tie';
    }
  }
  void Reset(){
    sleft = 0;
    sright = 0;
  }
}



