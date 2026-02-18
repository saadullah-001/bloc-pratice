import 'package:bloc_practice_v1/bloc/post/post_event.dart';
import 'package:bloc_practice_v1/bloc/post/post_state.dart';
import 'package:bloc_practice_v1/repositories/post_repository.dart';
import 'package:bloc_practice_v1/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository = PostRepository();
  late final List stateListImage;
  PostBloc() : super(const PostState()) {
    on<FetchEvent>(fetchEvent);
    on<SearchEvent>(searchEvent);
  }

  Future<void> fetchEvent(FetchEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final List data = await _postRepository.fetchData();
      emit(state.copyWith(postList: data, status: Status.success));
      stateListImage = data;
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> searchEvent(SearchEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final query = event.searchText.toLowerCase().trim();

      if (query.isEmpty) {
        emit(
          state.copyWith(
            postList: stateListImage, // original full list
            status: Status.success,
            isEmpty: false,
          ),
        );
        return;
      }

      final filteredList = stateListImage.where((e) {
        final idMatch = e.id.toString().toLowerCase().contains(query);

        final nameMatch = e.name.toString().toLowerCase().contains(query);

        return idMatch || nameMatch;
      }).toList();

      if (filteredList.isEmpty) {
        emit(state.copyWith(status: Status.success, isEmpty: true));
      } else {
        emit(
          state.copyWith(
            postList: filteredList,
            status: Status.success,
            isEmpty: false,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
