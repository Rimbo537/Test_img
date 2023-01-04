
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_img/data/image_repository.dart';
import 'package:test_img/model/image_model.dart';

part 'image_event.dart';
part 'image_state.dart';


class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc({required IImagesRepo imageRepo,}) : _imageRepo = imageRepo,
        super(const ImageState(images: <ImageModel>[]))
{
    on<LoadImage>(_onLoadImage);
    
  }
  final IImagesRepo _imageRepo;

 Future<void> _onLoadImage(
    LoadImage event,
    Emitter<ImageState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ImageStateStatus.loading,
        ),
      );

      final image = await _imageRepo.fetchImage();

      return image.isNotEmpty
          ? emit(
              state.copyWith(
                images: List.of(state.images)..addAll(image),
                status: ImageStateStatus.success,
              ),
            )
          : emit(
              state.copyWith(
                images: image,
                status: ImageStateStatus.success,
              ),
            );
    } catch (e) {
      return emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ImageStateStatus.failure,
        ),
      );
    }
  }

  
  
}
