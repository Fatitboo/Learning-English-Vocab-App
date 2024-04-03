import 'package:client/view/signup/signup_controller.dart';
import 'package:get/get.dart';
class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}