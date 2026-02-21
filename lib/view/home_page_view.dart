import 'package:bloc_practice_v1/bloc/counter/homepage_bloc.dart';
import 'package:bloc_practice_v1/bloc/counter/homepage_event.dart';
import 'package:bloc_practice_v1/bloc/counter/homepage_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final HomepageBloc _homepageBloc = HomepageBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _homepageBloc,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomepageBloc, HomepageState>(
                builder: (context, state) {
                  return Text("Counter Value: ${state.counterValue}");
                },
              ),

              BlocBuilder<HomepageBloc, HomepageState>(
                buildWhen: (previous, current) => false,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomepageBloc>().add(
                            HomepageIncrementEvent(),
                          );
                        },
                        child: const Text("Increment"),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomepageBloc>().add(
                            HomepageDecrementEvent(),
                          );
                        },
                        child: const Text("Decrement"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
