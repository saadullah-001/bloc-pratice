import 'package:bloc_practice_v1/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final List postList;
  final Status status;
  const PostState({this.postList = const [], this.status = Status.loading});

  PostState copyWith({List? postList, Status? status}) {
    return PostState(
      postList: postList ?? this.postList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [postList, status];
}
