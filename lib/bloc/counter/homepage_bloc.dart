import 'package:bloc/bloc.dart';
import 'package:bloc_practice_v1/bloc/counter/homepage_event.dart';
import 'package:bloc_practice_v1/bloc/counter/homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(const HomepageState()) {
    on<HomepageIncrementEvent>(_incrementCounter);
    on<HomepageDecrementEvent>(_decrementCounter);
  }

  void _incrementCounter(
    HomepageIncrementEvent event,
    Emitter<HomepageState> emit,
  ) {
    emit(state.copywith(counterValue: state.counterValue + 1));
  }

  void _decrementCounter(
    HomepageDecrementEvent event,
    Emitter<HomepageState> emit,
  ) {
    emit(state.copywith(counterValue: state.counterValue - 1));
  }
}
