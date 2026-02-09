import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();
  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends SliderEvent {}

class ChangeOpacityEvent extends SliderEvent {
  final double opacityValue;
  const ChangeOpacityEvent({required this.opacityValue});

  @override
  List<Object> get props => [opacityValue];
}
