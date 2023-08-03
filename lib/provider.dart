import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class homeController extends ChangeNotifier{
  int homeID = 1;
  void setSelectedHome(id){
    homeID = id;
    notifyListeners();
  }

}