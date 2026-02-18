import 'package:bloc_practice_v1/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final List postList;
  final Status status;
  final bool isEmpty;
  const PostState({
    this.postList = const [],
    this.status = Status.loading,
    this.isEmpty = false,
  });

  PostState copyWith({List? postList, Status? status, bool? isEmpty}) {
    return PostState(
      postList: postList ?? this.postList,
      status: status ?? this.status,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [postList, status, isEmpty];
}
