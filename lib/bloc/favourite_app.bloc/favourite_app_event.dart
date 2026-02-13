import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSelectEvent extends FavouriteAppEvent {
  final int id;
  OnSelectEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class OnFavouriteEvent extends FavouriteAppEvent {
  final int id;
  OnFavouriteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class OnDeleteEvent extends FavouriteAppEvent {}

class OnNewEvent extends FavouriteAppEvent {}

class OnLoadEvent extends FavouriteAppEvent {}
