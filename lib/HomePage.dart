import 'package:flutter/material.dart';
import 'package:pathos/mywidgets.dart';
import 'package:pathos/provider.dart';
import 'package:provider/provider.dart';
import 'package:pathos/HomeScreen.dart';

import 'OederScreen.dart';
import 'TablesScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homecont = Provider.of<homeController>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFFD9F4FB),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.29,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xFFBFEBF4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(350),
                  bottomRight: Radius.circular(350),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'pathos',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 7, 52, 90),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Order',
                              style: TextStyle(
                                  color: Color(0xFF3DC7F4), fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        SizedBox(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'News',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3DC7F4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                
                  children: [
                    Column(
                      children: [
                        HomeBar("Home", "assets/images/home.png",1, 
                          ),
                        HomeBar("Tables", "assets/images/home.png",2),
                        HomeBar("Orders", "assets/images/order.png",3),
                        HomeBar("News","assets/images/news.png", 4),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Container(
                      
                      width: homecont.homeID == 1
                          ? MediaQuery.of(context).size.width / 1.5
                          : MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: homecont.homeID == 1
                          ? Row(
                              children: [
                                Expanded(
                                  child: HomescreenWidget(),
                                ),
                              ],
                            )
                          : homecont.homeID == 2
                              ? TablesWidget()
                              : homecont.homeID == 3
                                  ? OrderWidget()
                                  : Container(
                                      child: Text("News"),
                                    ),
                    ),
                    const SizedBox(width: 20),
                    if (homecont.homeID == 1)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          
                          children: [
                            OrderCard('you been assigned new order', 'Table #3',
                                '2:00 pm', const Color(0xFF48BFAC), Colors.white),
                            const SizedBox(height: 10),
                            OrderCard('you been assigned new order', 'Table #3',
                                '2:00 pm',const  Color(0xFF48BFAC), Colors.white),
                            const SizedBox(height: 10),
                            OrderCard('you been assigned new order', 'Table #3',
                                '2:00 pm',const Color(0xFF48BFAC), Colors.white),
                            const SizedBox(height: 10),
                            OrderCard('you been assigned new order', 'Table #3',
                                '2:00 pm',Colors.white, Colors.black),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
