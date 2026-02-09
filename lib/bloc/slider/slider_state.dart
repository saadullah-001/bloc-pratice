import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final bool isToggle;
  final double opacityValue;

  const SliderState({this.isToggle = false, this.opacityValue = 1.0});

  SliderState copyWith({bool? isToggle, double? opacityValue}) {
    return SliderState(
      isToggle: isToggle ?? this.isToggle,
      opacityValue: opacityValue ?? this.opacityValue,
    );
  }

  @override
  List<Object> get props => [isToggle, opacityValue];
}
