import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  XFile? imageFile;

  final ImagePicker picker = ImagePicker();

  Future<XFile?> cameraImage() async {
    imageFile = await picker.pickImage(source: ImageSource.camera);
    return imageFile;
  }

  Future<XFile?> galleryImage() async {
    imageFile = await picker.pickImage(source: ImageSource.gallery);
    return imageFile;
  }

  Future<XFile?> selectImagefrom(ImageSource source) async {
    imageFile = await picker.pickImage(source: source);
    return imageFile;
  }
}
