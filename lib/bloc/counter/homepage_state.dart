import 'package:equatable/equatable.dart';

class HomepageState extends Equatable {
  final int counterValue;
  const HomepageState({this.counterValue = 0});

  @override
  List<Object> get props => [counterValue];

  HomepageState copywith({int? counterValue}) {
    return HomepageState(counterValue: counterValue ?? this.counterValue);
  }
}
