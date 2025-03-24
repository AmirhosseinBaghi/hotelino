import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/shared/servises/json_data_service.dart';

class HotelRepository {
  final JsonDataService jsonDataService;

  HotelRepository({required this.jsonDataService});

  Future<List<Hotel>> fetchHotel() async {
    return jsonDataService.loadHotel();
  }

  Future<Hotel> getHotelById(String id) {
    return jsonDataService.loadHotel().then(
      (hotels) {
        return hotels.firstWhere(
          (hotel) => hotel.id == id,
        );
      },
    );
  }
}
