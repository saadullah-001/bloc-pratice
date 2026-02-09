import 'dart:io';
import 'package:bloc_practice_v1/bloc/image/image_bloc.dart';
import 'package:bloc_practice_v1/bloc/image/image_event.dart';
import 'package:bloc_practice_v1/bloc/image/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  void showSelectImageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  context.read<ImageBloc>().add(CameraEvent());
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  context.read<ImageBloc>().add(GalleryEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            return state.isLoading == true
                ? CircularProgressIndicator()
                : state.errorMessage != null && state.errorMessage!.isNotEmpty
                ? Text(state.errorMessage!)
                : state.imageFile == null
                ? CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        showSelectImageDialog(context);
                      },
                      icon: Icon(Icons.image),
                    ),
                  )
                : Image.file(File(state.imageFile!.path));
          },
        ),
      ),
    );
  }
}
