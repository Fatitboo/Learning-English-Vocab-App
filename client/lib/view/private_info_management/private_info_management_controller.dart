import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class PrivateInfoManagementController extends GetxController {
  String avatarPath = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      avatarPath = pickedFile.path;
      update();
    }
  }
}