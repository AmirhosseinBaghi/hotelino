import 'package:flutter/material.dart';
import 'package:hotelino/feachures/favorite/presentation/widgets/favorite_item.dart';
import 'package:hotelino/feachures/home/presentation/provider/favorite_list_provider.dart';
import 'package:hotelino/feachures/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/feachures/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/feachures/home/presentation/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "هتل های مورد علاقه",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 16,
            ),
            SearchbarWidget(),
            SizedBox(
              height: 16,
            ),
            Consumer<FavoriteListProvider>(
              builder: (context, favoriteProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: favoriteProvider.favoritesHotelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: FavoriteHotelCard(
                        hotel: favoriteProvider.favoritesHotelList[index],
                        onRemoveFavotiteClicked: (hotelId) {
                          favoriteProvider.toggleFavorite(hotelId);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                if (profileProvider.recentlyViewedHotels.isNotEmpty) {
                  return HotelListSection(
                      title: "بازدید های اخیر",
                      hotels: profileProvider.recentlyViewedHotels);
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
