import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();
  @override
  List<Object?> get props => [];
}

class CameraEvent extends ImageEvent {}

class GalleryEvent extends ImageEvent {}
