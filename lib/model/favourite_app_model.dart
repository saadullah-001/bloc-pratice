import 'package:equatable/equatable.dart';

class FavouriteAppModel extends Equatable {
  final int id;
  final String name;
  final bool isFavourite;
  final bool isChecked;

  const FavouriteAppModel({
    required this.id,
    this.isChecked = false,
    this.isFavourite = false,
    required this.name,
  });

  FavouriteAppModel copyWith({
    required int id,
    required String name,
    bool? isFav,
    bool? isCheck,
  }) {
    return FavouriteAppModel(
      id: id,
      name: name,
      isFavourite: isFav ?? isFavourite,
      isChecked: isCheck ?? isChecked,
    );
  }

  @override
  List<Object?> get props => [id, name, isChecked, isFavourite];
}
