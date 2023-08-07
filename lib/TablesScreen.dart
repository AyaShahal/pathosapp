import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pathos/provider.dart';
import 'package:provider/provider.dart';

class RectangleBorderWidget extends StatelessWidget {
  final Color outerBorderColor;
  final double outerBorderWidth;
  final Color innerBorderColor;
  final double innerBorderWidth;
  final int number;

  RectangleBorderWidget({
    this.outerBorderColor = Colors.black,
    this.outerBorderWidth = 5.0,
    this.innerBorderColor = Colors.red,
    this.innerBorderWidth = 2.0,
    this.number = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: outerBorderColor,
          width: outerBorderWidth,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: innerBorderColor,
            width: innerBorderWidth,
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularBorderWidget extends StatelessWidget {
  final Color outerBorderColor;
  final double outerBorderWidth;
  final Color innerBorderColor;
  final double innerBorderWidth;
  final int number;

  CircularBorderWidget({
    this.outerBorderColor = Colors.black,
    this.outerBorderWidth = 5.0,
    this.innerBorderColor = Colors.red,
    this.innerBorderWidth = 2.0,
    this.number = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: outerBorderColor,
                width: outerBorderWidth,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(outerBorderWidth),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: innerBorderColor,
                width: innerBorderWidth,
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BorderWidget extends StatelessWidget {
  final Color borderColor;
  final double borderWidth;

  BorderWidget(this.borderColor, this.borderWidth);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 10,
        width: borderWidth,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: borderColor,
              width: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class tableController with ChangeNotifier {
  int selectedTableID = 1;

  void setSelectedTable(int id) {
    selectedTableID = id;
    notifyListeners();
  }
}

Widget BottomBar(String text, int id) {
  return Builder(
    builder: (BuildContext context) {
      tableController tableCont = Provider.of<tableController>(context);

      return GestureDetector(
        onTap: () {
          tableCont.setSelectedTable(id);
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 9,
          height: MediaQuery.of(context).size.width / 30,
          decoration: BoxDecoration(
            color: tableCont.selectedTableID == id
                ? Color(0xFF3DC7F4)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      );
    },
  );
}

Widget TerraceView() {
  return Builder(
    builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tables - Terrace",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3DC7F4),
              ),
            ),
            const Text("10 of 20 Occupied to you"),
            const SizedBox(height: 10),
            Row(
              children: [
                BorderWidget(
                  const Color(0xFF3DC7F4),
                  70,
                ),
                const SizedBox(
                  width: 3,
                ),
                BorderWidget(
                  const Color(0xFFED4343),
                  150,
                ),
                const SizedBox(
                  width: 3,
                ),
                BorderWidget(
                  const Color(0xFFB4B4B4),
                  200,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              '3 Assigned to you',
              style: TextStyle(color: Color(0xFF3DC7F4)),
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 450,
                  height: 350,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return CircularBorderWidget(
                        outerBorderColor: Color(0xFF9EE3F9),
                        outerBorderWidth: 5.0,
                        innerBorderColor: Color(0xFF3DC7F4),
                        innerBorderWidth: 8.0,
                        number: index + 1,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  width: 400,
                  height: 350,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                      childAspectRatio: 400 / 300,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return RectangleBorderWidget(
                        outerBorderColor: Color(0xFF9EE3F9),
                        outerBorderWidth: 5.0,
                        innerBorderColor: Color(0xFF3DC7F4),
                        innerBorderWidth: 8.0,
                        number: 1,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget BarView() {
  return Builder(
    builder: (BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tables - Bar",
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3DC7F4),
              ),
            ),
            const Text("10 of 20 Occupied to you"),
            const SizedBox(height: 10),
            Row(
              children: [
                BorderWidget(
                  const Color(0xFF3DC7F4),
                  70,
                ),
                const SizedBox(
                  width: 3,
                ),
                BorderWidget(
                  const Color(0xFFED4343),
                  150,
                ),
                const SizedBox(
                  width: 3,
                ),
                BorderWidget(
                  const Color(0xFFB4B4B4),
                  200,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              '3 Assigned to you',
              style: TextStyle(color: Color(0xFF3DC7F4)),
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 450,
                  height: 350,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return CircularBorderWidget(
                        outerBorderColor: Color(0xFF9EE3F9),
                        outerBorderWidth: 5.0,
                        innerBorderColor: Color(0xFF3DC7F4),
                        innerBorderWidth: 8.0,
                        number: index + 1,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                SizedBox(
                  width: 400,
                  height: 350,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 20,
                      childAspectRatio: 400 / 300,
                    ),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return RectangleBorderWidget(
                        outerBorderColor: Color(0xFF9EE3F9),
                        outerBorderWidth: 5.0,
                        innerBorderColor: Color(0xFF3DC7F4),
                        innerBorderWidth: 8.0,
                        number: 1,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class TablesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    tableController tableCont = Provider.of<tableController>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: tableCont.selectedTableID == 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tables - Main",
                  style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3DC7F4),
                  ),
                ),
                const Text("10 of 20 Occupied to you"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    BorderWidget(
                      const Color(0xFF3DC7F4),
                      70,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    BorderWidget(
                      const Color(0xFFED4343),
                      150,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    BorderWidget(
                      const Color(0xFFB4B4B4),
                      200,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  '3 Assigned to you',
                  style: TextStyle(color: Color(0xFF3DC7F4)),
                ),
                const SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 450,
                      height: 350,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return CircularBorderWidget(
                            outerBorderColor: Color(0xFF9EE3F9),
                            outerBorderWidth: 5.0,
                            innerBorderColor: Color(0xFF3DC7F4),
                            innerBorderWidth: 8.0,
                            number: index + 1,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    SizedBox(
                      width: 400,
                      height: 350,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 20,
                          childAspectRatio: 400 / 300,
                        ),
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return RectangleBorderWidget(
                            outerBorderColor: Color(0xFF9EE3F9),
                            outerBorderWidth: 5.0,
                            innerBorderColor: Color(0xFF3DC7F4),
                            innerBorderWidth: 8.0,
                            number: 1,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: tableCont.selectedTableID == 2,
            child: BarView(),
          ),
          Visibility(
            visible: tableCont.selectedTableID == 3,
            child: TerraceView(),
          ),
          Center(
            child: Container(
              width: 468,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF46607E)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomBar("Main", 1),
                  const SizedBox(width: 20,),
                  BottomBar("Bar", 2),
                   const SizedBox(width: 20,),
                  BottomBar("Terrace", 3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
