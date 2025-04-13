import 'package:flutter/material.dart';
import 'package:hotelino/feachures/favorite/presentation/widget/favorite_item.dart';
import 'package:hotelino/feachures/home/presentation/provider/favorite_list_provider.dart';
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
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: FavoriteHotelCard(
                    hotel: favoriteProvider.favoritesHotelList[0],
                    onRemoveFavotiteClicked: (hotelId) {
                      favoriteProvider.toggleFavorite(hotelId);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
