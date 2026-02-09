import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImageState extends Equatable {
  final XFile? imageFile;
  final bool isLoading;
  final String? errorMessage;
  const ImageState({
    this.imageFile,
    this.isLoading = false,
    this.errorMessage = '',
  });

  ImageState copyWith({
    XFile? imageFile,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ImageState(
      imageFile: imageFile ?? this.imageFile,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [imageFile, isLoading, errorMessage];
}
