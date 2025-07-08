import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/presentation/widgets/hotel_card_vertical.dart';

class HotelVerticalList extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;
  const HotelVerticalList(
      {super.key, required this.title, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HotelCardVertical(hotels: hotels[index]),
            );
          },
        )
      ],
    );
  }
}
