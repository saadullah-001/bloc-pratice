import 'package:bloc_practice_v1/bloc/favourite_app.bloc/favourite_app_event.dart';
import 'package:bloc_practice_v1/bloc/favourite_app.bloc/favourite_app_state.dart';
import 'package:bloc_practice_v1/model/favourite_app_model.dart';
import 'package:bloc_practice_v1/repositories/favourite_app_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  List<FavouriteAppModel> list = [];
  final FavouriteAppRepository repository = FavouriteAppRepository();

  FavouriteAppBloc() : super(const FavouriteAppState()) {
    on<OnSelectEvent>(_onSelectEvent);
    on<OnFavouriteEvent>(_onFavouriteEvent);
    on<OnDeleteEvent>(_onDeleteEvent);
    on<OnNewEvent>(_onNewEvent);
    on<OnLoadEvent>(_onLoadEvent);
  }

  void _onLoadEvent(OnLoadEvent event, Emitter<FavouriteAppState> emit) async {
    try {
      emit(state.copyWith(status: FavouriteAppStatus.loading));
      list = await repository.fetchList();
      emit(state.copyWith(list: list, status: FavouriteAppStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FavouriteAppStatus.failure));
    }
  }

  void _onSelectEvent(OnSelectEvent event, Emitter<FavouriteAppState> emit) {
    final updatedList = List<FavouriteAppModel>.from(state.list);

    final index = updatedList.indexWhere((element) => element.id == event.id);
    if (index == -1) return;

    updatedList[index] = updatedList[index].copyWith(
      id: updatedList[index].id,
      name: updatedList[index].name,
      isCheck: !updatedList[index].isChecked,
    );
    emit(state.copyWith(list: updatedList, status: FavouriteAppStatus.success));
  }

  void _onFavouriteEvent(
    OnFavouriteEvent event,
    Emitter<FavouriteAppState> emit,
  ) {
    final updatedList = List<FavouriteAppModel>.from(state.list);

    final index = updatedList.indexWhere((element) => element.id == event.id);
    if (index == -1) return;

    updatedList[index] = updatedList[index].copyWith(
      id: updatedList[index].id,
      name: updatedList[index].name,
      isFav: !updatedList[index].isFavourite,
    );
    emit(state.copyWith(list: updatedList, status: FavouriteAppStatus.success));
  }

  void _onDeleteEvent(OnDeleteEvent event, Emitter<FavouriteAppState> emit) {
    final updatedList = List<FavouriteAppModel>.from(state.list);

    updatedList.removeWhere((element) => element.isChecked);

    emit(state.copyWith(list: updatedList, status: FavouriteAppStatus.success));
  }

  void _onNewEvent(OnNewEvent event, Emitter<FavouriteAppState> emit) {
    final updatedList = List<FavouriteAppModel>.from(state.list);
    final newId = DateTime.now().microsecondsSinceEpoch;
    updatedList.add(FavouriteAppModel(id: newId, name: "New Item $newId"));
    emit(state.copyWith(list: updatedList, status: FavouriteAppStatus.success));
  }
}
