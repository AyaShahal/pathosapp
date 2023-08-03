import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pathos/provider.dart';
import 'package:provider/provider.dart';

Widget HomeBar(
  String text ,
  // String pressedimg,
int id) {
  return Builder(
    builder: (BuildContext context) {
      homeController homecont = Provider.of<homeController>(context);
      return GestureDetector(
        onTap: (){homecont.setSelectedHome(id);},
        child: Container(
          width: MediaQuery.of(context).size.width/10,
          height: MediaQuery.of(context).size.width/10,
          decoration: BoxDecoration(
             color: homecont.homeID == id ? Colors.white: Colors.transparent,
              borderRadius:const BorderRadius.only(
                  bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))),
                  child: Column(children: [
                    Icon(Icons.home,color: Colors.black,),
                    Text(text),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        ),
      );
    },
  );
}

Widget HomescreenWidget() {
  return Builder(
    builder: (BuildContext context) {
      return const Center(
        child: Text("Home screen"),
      );
    },
  );
}

Widget TablesWidget() {
  return Builder(
    builder: (BuildContext context) {
      return const Center(
        child: Text("Table screen"),
      );
    },
  );
}

Widget OrderWidget() {
  return Builder(
    builder: (BuildContext context) {
      return const Center(
        child: Text("Order screen"),
      );
    },
  );
}

Widget NewsWidget() {
  return Builder(
    builder: (BuildContext context) {
      return const Center(
        child: Text("News screen"),
      );
    },
  );
}
