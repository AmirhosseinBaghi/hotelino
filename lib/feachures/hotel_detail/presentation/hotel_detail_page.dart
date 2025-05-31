import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/shared/servises/json_data_service.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key, required this.hotelId});
  final String hotelId;
  @override
  Widget build(BuildContext context) {
    final hotelRepository = HotelRepository(jsonDataService: JsonDataService());
    return FutureBuilder<Hotel>(
      future: hotelRepository.getHotelById(hotelId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final hotel = snapshot.data!;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    onLongPress: () {},
                    child: Image.network(
                        fit: BoxFit.cover, networkUrl(hotel.images.first)),
                  ),
                ),
                expandedHeight: 300,
                elevation: 8,
                leading: BackButton(
                  color: Colors.white,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hotel.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                          hotel.address,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ]),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
