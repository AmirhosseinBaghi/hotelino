import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';
import 'package:hotelino/feachures/home/data/repositories/hotel_repository.dart';
import 'package:hotelino/feachures/hotel_detail/presentation/full_screen_map.dart';
import 'package:hotelino/shared/servises/json_data_service.dart';
import 'package:latlong2/latlong.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "امکانات رفاهی",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        spacing: 12,
                        children: hotel.amenities.map(
                          (a) {
                            IconData icon;

                            switch (a) {
                              case 'کولر':
                                icon = Icons.ac_unit_rounded;
                                break;
                              case 'باشگاه':
                                icon = Icons.fitness_center_rounded;
                                break;
                              case 'رستوران':
                                icon = Icons.restaurant;
                                break;
                              case 'کافه':
                                icon = Icons.restaurant;
                                break;
                              case 'ساحل':
                                icon = Icons.beach_access_rounded;
                                break;
                              case 'استخر':
                                icon = Icons.pool_rounded;
                                break;
                              default:
                                icon = Icons.check_circle_outline_rounded;
                            }
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Icon(
                                    icon,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  a,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.black87),
                                )
                              ],
                            );
                          },
                        ).toList(),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'گالری تصاویر',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: hotel.images.length,
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      networkUrl(hotel.images[index]),
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (index != 0)
                                  SizedBox(
                                    width: 8,
                                  )
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "توضیحات",
                        style: Theme.of(context).textTheme.headlineSmall,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        hotel.description,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.5),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: FullScreenMap(
                                        lat: hotel.location.latitude,
                                        lon: hotel.location.longitude,
                                        name: hotel.name));
                              },
                              child: Text(
                                "مشاهده نقشه",
                                textDirection: TextDirection.rtl,
                              )),
                          Text(
                            'موقعیت مکانی هتل بر روی نقشه',
                            style: Theme.of(context).textTheme.headlineSmall,
                            textDirection: TextDirection.rtl,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)),
                        child: FlutterMap(
                            options: MapOptions(
                                initialZoom: 15.0,
                                initialCenter: LatLng(hotel.location.latitude,
                                    hotel.location.longitude),
                                interactionOptions: InteractionOptions(
                                    flags: InteractiveFlag.all &
                                        ~InteractiveFlag.rotate)),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{s}/{x}/{y}.png',
                                userAgentPackageName: "com.example.hotelino",
                              ),
                              MarkerLayer(markers: [
                                Marker(
                                    width: 80,
                                    height: 80,
                                    point: LatLng(hotel.location.latitude,
                                        hotel.location.longitude),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 2,
                                          ),
                                          color: Colors.white60,
                                          child: Text(
                                            hotel.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.black),
                                            textDirection: TextDirection.rtl,
                                          ),
                                        )
                                      ],
                                    ))
                              ])
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      )
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
