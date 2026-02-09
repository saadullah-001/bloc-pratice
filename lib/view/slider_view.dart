import 'package:bloc_practice_v1/bloc/slider/slider_bloc.dart';
import 'package:bloc_practice_v1/bloc/slider/slider_event.dart';
import 'package:bloc_practice_v1/bloc/slider/slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) {
                  return Text(state.isToggle ? "Light Mode" : "Dark Mode");
                },
              ),
              BlocBuilder<SliderBloc, SliderState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isToggle,
                    onChanged: (newValue) {
                      context.read<SliderBloc>().add(ToggleThemeEvent());
                      debugPrint("build2");
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          BlocBuilder<SliderBloc, SliderState>(
            builder: (context, state) {
              return Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: state.opacityValue),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          BlocBuilder<SliderBloc, SliderState>(
            builder: (context, state) {
              return Slider(
                value: state.opacityValue,
                onChanged: (value) {
                  context.read<SliderBloc>().add(
                    ChangeOpacityEvent(opacityValue: value),
                  );
                  debugPrint("build2");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
