import 'package:bloc/bloc.dart';
import 'package:bloc_practice_v1/bloc/slider/slider_event.dart';
import 'package:bloc_practice_v1/bloc/slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderState()) {
    on<ToggleThemeEvent>(_toggleThemeEvent);
    on<ChangeOpacityEvent>(_changeOpacityEvent);
  }

  void _toggleThemeEvent(ToggleThemeEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(isToggle: !state.isToggle));
  }

  void _changeOpacityEvent(
    ChangeOpacityEvent event,
    Emitter<SliderState> emit,
  ) {
    emit(state.copyWith(opacityValue: event.opacityValue));
  }
}
