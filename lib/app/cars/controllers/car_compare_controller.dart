import 'package:get/get.dart';

class CarsCompareController extends GetxController {

  bool isChecked = false;


  changeValueOfCheckBox(bool value){
    isChecked=value;
    update();
  }
}