import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_img/model/image_model.dart';

mixin IImagesRepo {
  Future<List<ImageModel>> fetchImage();
}

class ImagesRepository implements IImagesRepo {
  @override
  Future<List<ImageModel>> fetchImage() async {
    final response = await rootBundle.loadString('assets/test_api_json.json');
    final json = jsonDecode(response) as List<dynamic>;
    final images = json
        .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return images;
  }
}
