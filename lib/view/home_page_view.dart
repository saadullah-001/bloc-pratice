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
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomepageBloc, HomepageState>(
              builder: (context, state) {
                return Text("Counter Value: ${state.counterValue}");
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<HomepageBloc>().add(HomepageIncrementEvent());
                  },
                  child: const Text("Increment"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomepageBloc>().add(HomepageDecrementEvent());
                  },
                  child: const Text("Decrement"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
