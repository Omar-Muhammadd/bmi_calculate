import 'dart:math';

import 'package:bmi_calculate/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class bmi_screen extends StatefulWidget{

  @override
  State<bmi_screen> createState() => _bmi_screenState();
}

class _bmi_screenState extends State<bmi_screen> {
  
  bool isMale = true;
  double height = 100;
  int age = 20;
  double weight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                      setState(() {
                        isMale = true;
                      });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isMale? Colors.blue : Colors.black12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              width: 85,
                                image: AssetImage('images/male.png'),
                            ),
                            SizedBox(height: 10,),
                            Text(
                                'MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: !isMale? Colors.blue : Colors.black12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              width: 80,
                                image: AssetImage(
                                  'images/female.png',
                                ),
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        max: 250,
                        min: 70,
                        value: height,
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'AGE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '${age.round()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                    onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                    },
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                    age++;
                                  });},
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '${weight.round()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: (){
                double result = weight / pow( height / 100, 2);

                Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context) => BmiResultScreen(
                      isMale: isMale,
                      age: age,
                      result: result,
                    ),
                ),
                );
              },
              child: const Text(
              'Calculate',
            ),
            ),
          ),
        ],
      ),
    );
  }
}
