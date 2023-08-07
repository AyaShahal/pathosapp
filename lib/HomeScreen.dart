import 'package:flutter/material.dart';
import 'package:pathos/provider.dart';
import 'package:pathos/provider.dart';
import 'package:provider/provider.dart';

Widget OrderCard(String text1, String text2, String text3,
    Color backgroundColor, Color textColor) {
  return Container(
    width: 250,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: backgroundColor,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text2,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text3,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Card(
  Color color1,
  Color color2,
  String text,
  String x,
) {
  return Builder(
    builder: (BuildContext context) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 350,
              height: 165,
              color: color1,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 350 / 1.4,
              height: 165,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: const BorderRadius.only(
                  // topRight: Radius.circular(100),
                  bottomRight: Radius.circular(150),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        x,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF48BFAC),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

class HomescreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    homeController homecont =
        Provider.of<homeController>(context, listen: true);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                homecont.setSelectedHome(2);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 350,
                      height: 350,
                      color: const Color(0xFF46607E),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 350,
                      height: 290,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6480A0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(180),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Table Occupied",
                            style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF46607E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
          Column(
            children: [
              Card(
                Color(0xFF5BC6B4),
                Color.fromARGB(255, 95, 214, 194),
                'Total Guests',
                '15',
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                Color(0xFF51CDF5),
                Color(0xFF3DC7F4),
                'Table assigned to you',
                '3',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
