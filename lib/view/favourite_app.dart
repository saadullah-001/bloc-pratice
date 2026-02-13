import 'package:bloc_practice_v1/bloc/favourite_app.bloc/favourite_app_bloc.dart';
import 'package:bloc_practice_v1/bloc/favourite_app.bloc/favourite_app_event.dart';
import 'package:bloc_practice_v1/bloc/favourite_app.bloc/favourite_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavuriteApp extends StatefulWidget {
  const FavuriteApp({super.key});

  @override
  State<FavuriteApp> createState() => _FavuriteAppState();
}

class _FavuriteAppState extends State<FavuriteApp> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteAppBloc>().add(OnLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favurite App"),
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
            builder: (context, state) {
              return Visibility(
                visible: state.list.any((element) => element.isChecked),
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteAppBloc>().add(OnDeleteEvent());
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          ),

          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
          builder: (context, state) {
            if (state.status == FavouriteAppStatus.loading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.status == FavouriteAppStatus.success) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: state.list[index].isChecked,
                      onChanged: (_) {
                        context.read<FavouriteAppBloc>().add(
                          OnSelectEvent(id: state.list[index].id),
                        );
                      },
                    ),
                    title: Text(state.list[index].name),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite),
                      color: state.list[index].isFavourite
                          ? Colors.red
                          : Colors.grey,
                      onPressed: () {
                        context.read<FavouriteAppBloc>().add(
                          OnFavouriteEvent(id: state.list[index].id),
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.list.length,
              );
            } else {
              return Text("An unknown error");
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FavouriteAppBloc>().add(OnNewEvent());
        },
      ),
    );
  }
}
