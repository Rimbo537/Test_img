import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_img/bloc/image_bloc.dart';
import 'package:test_img/data/image_repository.dart';
import 'package:test_img/full_image_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state.status == ImageStateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ImageStateStatus.success) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Unsplash JSON')),
            ),
            body: ListView.builder(
              itemCount: state.images.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text('${state.images[index].altDescription}'),
                    subtitle: Text('${state.images[index].user.name}'),
                    leading: SizedBox(
                      width: 30,
                      child: GestureDetector(
                        child:
                            Image.network('${state.images[index].urls.thumb}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider<ImageBloc>(
                                create: (context) =>
                                    ImageBloc(imageRepo: ImagesRepository()),
                                child: FullImageScreen(
                                  image:
                                      state.images[index].urls.small.toString(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: Text(state.errorMessage),
          );
        }
      },
    );
  }
}
