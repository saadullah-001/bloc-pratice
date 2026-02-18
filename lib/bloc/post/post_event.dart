import 'package:equatable/equatable.dart';

class PostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchEvent extends PostEvent {}

class SearchEvent extends PostEvent {
  final String searchText;

  SearchEvent({required this.searchText});

  @override
  List<Object?> get props => [searchText];
}
