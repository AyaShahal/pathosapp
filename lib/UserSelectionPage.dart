import 'package:flutter/material.dart';
import './HomePage.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFADD7CD),
              Color(0xFFA3BEBC),
              Color(0xFF4D8793),
              Color(0xFF7F7E8C),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'pathos',
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 10, 70, 119),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome, User!',
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 82,
                  child: ElevatedButton(
                   onPressed: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3DC7F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: Color(0xFF31455C),
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFF31455C),
                          radius: 43,
                          child: Image.asset(
                            'assets/images/cloche.png',
                            height: 40,
                            width: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Waiter',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                 SizedBox(
                  width: 250,
                  height: 82,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3DC7F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: Color(0xFF31455C),
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFF31455C),
                          radius: 43,
                          child: Image.asset(
                            'assets/images/Cashier.png',
                            height: 40,
                            width: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Cashier',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
