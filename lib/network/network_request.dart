import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../model/photo.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  // static final String url =
  //     'https://gateway.pinata.cloud/ipfs/QmSjv4ByiwSiN4q8bQPeUgpRiwA5rEtoUFTB5DBTYfHjRK/_metadata.json';

  static List<Photo> parsePhotos(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Photo> photos = list.map((model) => Photo.fromJson(model)).toList();
    return photos;
  }

  static Future<List<Photo>> fetchPhotos() async {
    final uri = Uri.parse(
        'https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30');
// https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
    http.Response response = await http.get(uri);
    // final response = await http.get(Uri.https(
    //     'https://gateway.pinata.cloud/ipfs/QmSjv4ByiwSiN4q8bQPeUgpRiwA5rEtoUFTB5DBTYfHjRK/_metadata.json'));
    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else {
      throw Exception('Can\'t get photos');
    }
  }
}
