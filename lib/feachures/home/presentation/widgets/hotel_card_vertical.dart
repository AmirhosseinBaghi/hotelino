import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formatter.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/hotel_detail/presentation/hotel_detail_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HotelCardVertical extends StatelessWidget {
  final Hotel hotels;
  const HotelCardVertical({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
            withNavBar: false,
            context,
            screen: HotelDetailPage(hotelId: hotels.id));
      },
      child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                if (Theme.of(context).brightness == Brightness.light)
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      spreadRadius: 2)
                else
                  BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHigh
                          .withValues(alpha: 1),
                      blurRadius: 6,
                      spreadRadius: 2)
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12, left: 12),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'رزرو اتاق',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      hotels.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('${hotels.city} ${hotels.country}'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${hotels.bedType.count} , ${hotels.bedType.details}',
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.bed_rounded,
                          size: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text("از ${priceFormatter(hotels.pricePerNight)} / شب"),
                    SizedBox(
                      height: 4,
                    )
                  ],
                ),
              )),
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                child: Image.network(
                  networkUrl(
                    hotels.images[0],
                  ),
                  width: 100,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes!)
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: Text(
                      "خطا در بارگزاری تصویر",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.red),
                    ));
                  },
                ),
              )
            ],
          )),
    );
  }
}
