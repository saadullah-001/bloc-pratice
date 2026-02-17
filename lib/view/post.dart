import 'package:bloc_practice_v1/bloc/post/post_bloc.dart';
import 'package:bloc_practice_v1/bloc/post/post_event.dart';
import 'package:bloc_practice_v1/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (BuildContext context, state) {
            return ListView.separated(
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                final item = state.postList[index];
                return ListTile(
                  leading: CircleAvatar(child: Text(item.id.toString())),
                  title: Text(item.name.toString()),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(item.body.toString(), maxLines: 2),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 2);
              },
            );
          },
        ),
      ),
    );
  }
}
