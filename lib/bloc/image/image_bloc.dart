import 'package:bloc_practice_v1/bloc/image/image_event.dart';
import 'package:bloc_practice_v1/bloc/image/image_state.dart';
import 'package:bloc_practice_v1/utils/image_picker_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImagePickerUtil imagePickerUtil = ImagePickerUtil();
  ImageBloc() : super(ImageState()) {
    on<CameraEvent>(_camera);
    on<GalleryEvent>(_gallery);
  }
  void _camera(CameraEvent event, Emitter<ImageState> emit) async {
    emit(state.copyWith(isLoading: true));

    final XFile? image = await imagePickerUtil.cameraImage();

    try {
      emit(state.copyWith(imageFile: image, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to pick image: $e",
        ),
      );
    }
  }

  void _gallery(GalleryEvent event, Emitter<ImageState> emit) async {
    emit(state.copyWith(isLoading: true));
    final XFile? image = await imagePickerUtil.galleryImage();

    try {
      emit(state.copyWith(imageFile: image, isLoading: false));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: "Failed to Pick Image: $e",
        ),
      );
    }
  }
}
