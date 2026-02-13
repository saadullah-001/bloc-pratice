import 'package:bloc_practice_v1/model/favourite_app_model.dart';
import 'package:equatable/equatable.dart';

enum FavouriteAppStatus { loading, success, failure }

class FavouriteAppState extends Equatable {
  final List<FavouriteAppModel> list;
  final FavouriteAppStatus status;

  const FavouriteAppState({
    this.list = const [],
    this.status = FavouriteAppStatus.loading,
  });

  FavouriteAppState copyWith({
    List<FavouriteAppModel>? list,
    FavouriteAppStatus? status,
  }) {
    return FavouriteAppState(
      list: list ?? this.list,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [list, status];
}
