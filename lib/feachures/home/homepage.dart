import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feachures/home/presentation/widgets/ad_banner.dart';
import 'package:hotelino/feachures/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/feachures/home/presentation/widgets/hotel_list_section.dart';
import 'package:hotelino/feachures/home/presentation/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
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
            AdBanner(),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                    title: "محبوب ترین هتل ها",
                    hotels: homeProvider.getPopularHotels());
              },
            ),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return HotelListSection(
                    title: "پیشنهاد ویژه امروز",
                    hotels: homeProvider.getSpecialOfferHotels());
              },
            )
          ],
        ),
      ),
    );
  }
}
