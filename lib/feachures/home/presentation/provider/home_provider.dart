import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/data/repositories/hotel_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotel();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;

  fetchHotel() async {
    _hotels = await _hotelRepository.fetchHotel();
    notifyListeners();
  }
}
