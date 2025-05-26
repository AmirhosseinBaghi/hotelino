import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formatter.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/presentation/provider/favorite_list_provider.dart';
import 'package:hotelino/feachures/home/presentation/widgets/animated_favorite_button.dart';
import 'package:hotelino/feachures/hotel_detail/presentation/hotel_detail_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteListProvider>(context);
    final isFavorite = favoriteProvider.isFavorites(hotel.id);
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
            withNavBar: false,
            context,
            screen: HotelDetailPage(hotelId: hotel.id));
      },
      child: SizedBox(
        width: 280,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.network(
                      networkUrl(
                        hotel.images[0],
                      ),
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 8,
                      top: 8,
                      child: AnimatedFavoriteButton(
                        isFavorite: isFavorite,
                        onTap: () => favoriteProvider.toggleFavorite(hotel.id),
                      ))
                ],
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${hotel.rating} (${priceFormatter(hotel.reviewCount)})',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        hotel.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${hotel.city}, ${hotel.country}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: 18,
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'از ${priceFormatter(hotel.pricePerNight)} / شب',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "مشاهده و انتخاب اتاق",
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
