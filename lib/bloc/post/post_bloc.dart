import 'package:bloc_practice_v1/bloc/post/post_event.dart';
import 'package:bloc_practice_v1/bloc/post/post_state.dart';
import 'package:bloc_practice_v1/repositories/post_repository.dart';
import 'package:bloc_practice_v1/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<FetchEvent>(fetchEvent);
  }

  Future<void> fetchEvent(FetchEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final data = await PostRepository().fetchData();
      emit(state.copyWith(postList: data, status: Status.success));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: Status.error));
    }
  }
}
