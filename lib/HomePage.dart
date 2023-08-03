import 'package:flutter/material.dart';
import 'package:pathos/mywidgets.dart';
import 'package:pathos/provider.dart';
import 'package:provider/provider.dart';


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
                children: [
                 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
   const  Text(
      'pathos',
      style: TextStyle(
        fontSize:34,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 7, 52, 90),
      ),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Order'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('New'),
    ),
  ],
),

                  Row(
                    children: [
                   Column(children: [
                        HomeBar("Home", 1),
                        HomeBar("Tables", 2),
                        HomeBar("Orders", 3),
                        HomeBar("News", 4),
                      ], mainAxisAlignment: MainAxisAlignment.center),
                      Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 1.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: homecont.homeID == 1
                              ? Container(
                                  child: Text("Home"),
                                )
                              : homecont.homeID == 2
                                  ? Container(
                                      child: Text("Tables"),
                                    )
                                  : homecont.homeID == 3
                                      ? Container(
                                          child: Text("Orders"),
                                        )
                                      : Container(
                                          child: Text("News"),
                                        ))
                    ],
                  ),
                ],
              ))
          // Center(child: Text("sssss"))
        ],
      ),
    );
  }
}
  