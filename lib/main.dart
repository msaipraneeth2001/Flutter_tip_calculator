import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Tip calculator",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  num billAmount = 0,
      people = 1,
      tipPercentage = 0,
      tipAmount = 0,
      totalAmount = 0;

  void tipDecrement() {
    if (tipPercentage > 0) {
      setState(() {
        tipPercentage--;
      });
    }
  }

  void tipIncrement() {
    setState(() {
      tipPercentage++;
    });
  }

  void peopleDecrement() {
    if (people > 1) {
      setState(() {
        people--;
      });
    }
  }

  void peopleIncrement() {
    setState(() {
      people++;
    });
  }

  void calculate() {

    if (people == 1) {
      setState(() {
        tipAmount =
            num.parse((billAmount * (tipPercentage / 100)).toStringAsFixed(2));
        totalAmount = num.parse((billAmount + tipAmount).toStringAsFixed(2));
      });
    } else {
      setState(() {
        tipAmount = billAmount * (tipPercentage / 100);
        tipAmount = num.parse((tipAmount / people).toStringAsFixed(2));
        totalAmount =
            num.parse((billAmount + tipAmount * people).toStringAsFixed(2));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
          padding:  EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "myassets/tipimage.jpg",
                height: 200,
                width: 200,
              ),
              const Text(
                "Tip Calculator",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (val) {
                  billAmount = double.parse(val);
                },
                decoration: const InputDecoration(hintText: "Bill Amount"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const Text("Tip Percentage"),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        tipDecrement();
                      },
                      child: const Icon(Icons.remove_circle)),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("${tipPercentage} %"),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        tipIncrement();
                      },
                      child: const Icon(Icons.add_circle)),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  const Text("Number of People in the Group"),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        peopleDecrement();
                      },
                      child: const Icon(Icons.remove_circle)),
                  const SizedBox(
                    width: 8,
                  ),
                  Text("${people}"),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        peopleIncrement();
                      },
                      child: const Icon(Icons.add_circle)),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (billAmount > 0) {
                    calculate();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(24)),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              tipAmount != 0
                  ? Text("Tip: ${tipAmount} per person")
                  : Container(),
              const SizedBox(
                height: 15,
              ),
              totalAmount != 0
                  ? Text("Total Amount: ${totalAmount}")
                  : Container(),
            ],
          )),
    );
  }
}
