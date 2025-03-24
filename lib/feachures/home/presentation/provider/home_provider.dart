import 'package:flutter/material.dart';
import 'package:hotelino/core/constant/constant.dart';
import 'package:hotelino/feachures/home/data/models/homepage_data.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/data/repositories/hotel_repository.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotel();
  }
  List<Hotel> _hotels = [];
  List<Hotel> get hotels => _hotels;

  final HomePageData _homePageData = HomePageDataConstants.homePageData;
  HomePageData get homePageData => _homePageData;

  fetchHotel() async {
    _hotels = await _hotelRepository.fetchHotel();
    notifyListeners();
  }

  //filter methods--------------------------------------------------------------------------

  List<Hotel> getPopularHotels() {
    return _hotels
        .where(
          (hotel) => _homePageData.popular.contains(hotel.id),
        )
        .toList();
  }

  List<Hotel> getSpecialOfferHotels() {
    return _hotels
        .where(
          (hotel) => _homePageData.specialOffers.contains(hotel.id),
        )
        .toList();
  }

  List<Hotel> getNewestHotels() {
    return _hotels
        .where(
          (hotel) => _homePageData.newest.contains(hotel.id),
        )
        .toList();
  }
}
