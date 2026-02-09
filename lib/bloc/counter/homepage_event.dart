import 'package:equatable/equatable.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class HomepageIncrementEvent extends HomepageEvent {}

class HomepageDecrementEvent extends HomepageEvent {}
