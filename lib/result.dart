import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.result,
    @required this.isMale,
    @required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result < 18.5)
      resultText = 'Underweight';
    else if (result >= 18.5 && result <= 24.9)
      resultText = 'Normal';
    else if (result >= 25.0 && result <= 29.9)
      resultText = 'Overweight';
    else if (result >= 30.0 && result <= 34.9)
      resultText = 'Obese';
    else
      resultText = 'Extremely Obese';
    return resultText;
  }

  String get bodyShape {
    String image = '';
    if (result < 18.5)
      isMale ? image = 'assets/underweight_male.jpg': image = 'assets/underweight.jpg';
    else if (result >= 18.5 && result <= 24.9)
      isMale ? image = 'assets/normal_male.jpg': image = 'assets/normal_female.jpg';

    else if (result >= 25.0 && result <= 29.9)
      isMale ? image = 'assets/overwieght_male.jpg': image = 'assets/overwieght_female.jpg';

    else if (result >= 30.0 && result <= 34.9)
      isMale ? image = 'assets/obese_male.jpg': image = 'assets/obese.jpg';

    else
      isMale ? image = 'assets/extremlyobese_male.jpg': image = 'assets/extremlyobese_female.jpg';

    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45,45,45,100),
        appBar: AppBar(title: const Text('Result'), centerTitle: true),
        body: SafeArea(
            child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        height: 300,
                      width: 350,
                      child: Image.asset('$bodyShape')),

                      Container(

                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(

                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(10,12,35,255),
                                    //border: Border.all(color: Colors.red,width: 3)
                                  ),
                                  child: Text(
                                    'BMI:',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${result.toStringAsFixed(1)}',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$resultPhrase',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline1,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),


    ],
    ),
                ),

    ),
    );
  }
}
