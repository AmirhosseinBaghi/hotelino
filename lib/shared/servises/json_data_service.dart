import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hotelino/core/constant/constant.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';

class JsonDataService {
  Future<List<Hotel>> loadHotel() async {
    final String response = await rootBundle.loadString(AppConstant.hotelsData);
    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> hotelsList = jsonData["hotels"];
    return hotelsList
        .map(
          (hotel) => Hotel.fromJson(hotel as Map<String, dynamic>),
        )
        .toList();
  }
}
