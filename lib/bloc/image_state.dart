part of 'image_bloc.dart';

enum ImageStateStatus { initial, loading, success, failure }

class ImageState extends Equatable {
  const ImageState({
    this.status = ImageStateStatus.initial,
    this.errorMessage = '',
    required this.images,
  });

  final ImageStateStatus status;
  final String errorMessage;
  final List<ImageModel> images;

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        images,
      ];

  ImageState copyWith({
    ImageStateStatus? status,
    String? errorMessage,
    List<ImageModel>? images,
  }) {
    return ImageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      images: images ?? this.images,
    );
  }
}