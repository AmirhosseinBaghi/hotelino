import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/data/repositories/hotel_repository.dart';

class FavoriteListProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;
  FavoriteListProvider(this._hotelRepository) {
    fetchHotel();
  }
  final _favoritesHotelId = [];
  List<Hotel> get favoritesHotelList => _hotels
      .where(
        (hotel) => _favoritesHotelId.contains(hotel.id),
      )
      .toList();
  List<Hotel> _hotels = [];

  fetchHotel() async {
    _hotels = await _hotelRepository.fetchHotel();
    notifyListeners();
  }

  bool isFavorites(String hotelId) {
    return _favoritesHotelId.contains(hotelId);
  }

  void toggleFavorite(String hotelId) {
    if (_favoritesHotelId.contains(hotelId)) {
      _favoritesHotelId.remove(hotelId);
    } else {
      _favoritesHotelId.add(hotelId);
    }
    notifyListeners();
  }
}
