
import 'package:get/get.dart';

class DetailLearnedController extends GetxController {
  DetailLearnedController();
  int _a = 5;
  int get a => _a;

  void increase() {
    _a++;
    update();
    print(a);
  }
}