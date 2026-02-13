import 'package:bloc_practice_v1/model/favourite_app_model.dart';

class FavouriteAppRepository {
  Future<List<FavouriteAppModel>> fetchList() async {
    await Future.delayed(Duration(seconds: 2));
    return List.of(getList(count: 10));
  }

  List<FavouriteAppModel> getList({required int count}) {
    return List.generate(
      count,
      (index) => FavouriteAppModel(
        id: DateTime.now().microsecondsSinceEpoch + index,
        name: "Favourite App Item $index",
      ),
    );
  }
}
