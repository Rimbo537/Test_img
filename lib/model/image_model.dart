import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'image_model.freezed.dart';
part 'image_model.g.dart';

List<ImageModel> imageModelFromJson(String str) => List<ImageModel>.from(
      json.decode(str).map(ImageModel.fromJson) as List<ImageModel>,
    );

String imageModelToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required User user,
    required Urls urls,
    @JsonKey(name: 'alt_description')
   @Default('Some Sescription') String? altDescription,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

@freezed
class Urls with _$Urls {
  const factory Urls({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
    String? smallS3,
  }) = _Urls;

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? username,
    String? name,
     @JsonKey(name: 'first_name')
    String? firstName,
     @JsonKey(name: 'last_name')
    String? lastName,
    ProfileImage? profileImage,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class ProfileImage with _$ProfileImage {
  const factory ProfileImage({
    String? small,
    String? medium,
    String? large,
  }) = _ProfileImage;

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);
}

/*
class ImagesList {
  List<Image> images;
  List<User> authors;
  ImagesList({required this.images});
}

class Image {
  final int element;

  Image(this.element);
}

class User {
final firs

}
*/
