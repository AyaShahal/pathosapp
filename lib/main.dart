import 'package:flutter/material.dart';
import 'package:pathos/HomePage.dart';
import 'package:pathos/UserSelectionPage.dart';
import 'package:pathos/provider.dart';
import 'package:provider/provider.dart';

import 'TablesScreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => homeController()),
        ChangeNotifierProvider(create: (_) => tableController()),
    
      ],
      child: MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PinCodeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  TextEditingController pinEditingController = TextEditingController();
  bool isTapped = false;

  void onNumberTap(String number) {
    setState(() {
      if (number == "0" && pinEditingController.text.isEmpty) {
        return;
      }

      pinEditingController.text += number;
      isTapped = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          isTapped = false;
        });
      });

      if (pinEditingController.text.length == 5) {
        onPinEntered(pinEditingController.text);
      }
    });
  }

  void onPinEntered(String pin) {
    if (pin == "12345") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      print("Incorrect pin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFADD7CD),
              Color(0xFFA3BEBC),
              Color(0xFF4D8793),
              Color(0xFF7F7E8C)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'pathos',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 52, 90),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Enter Pin',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    SizedBox(
                        width: 40,
                        child: PinCodeCircle(
                            isFilled: i < pinEditingController.text.length))
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 300,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CircleNumberTile(
                      number: (index + 1).toString(),
                      onTap: onNumberTap,
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 75,
                height: 75,
                child: CircleNumberTile(number: "0", onTap: onNumberTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PinCodeCircle extends StatelessWidget {
  final bool isFilled;

  const PinCodeCircle({Key? key, required this.isFilled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFilled ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

class CircleNumberTile extends StatelessWidget {
  final String number;
  final Function(String) onTap;

  const CircleNumberTile({Key? key, required this.number, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(number);
        print('Tapped number: $number');
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          gradient: const RadialGradient(
            colors: [Colors.transparent, Color(0x0092ACB0)],
            center: Alignment(0, 0),
            focal: Alignment(0, 0),
            focalRadius: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
