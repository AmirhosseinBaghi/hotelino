import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FullScreenMap extends StatelessWidget {
  final double lat;
  final double lon;
  final String name;
  const FullScreenMap(
      {super.key, required this.lat, required this.lon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
              initialZoom: 15.0,
              initialCenter: LatLng(lat, lon),
              interactionOptions:
                  InteractionOptions(flags: InteractiveFlag.all)),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{s}/{x}/{y}.png',
              userAgentPackageName: "com.example.hotelino",
            ),
            MarkerLayer(markers: [
              Marker(
                  width: 80,
                  height: 80,
                  point: LatLng(lat, lon),
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
                          name,
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
    );
  }
}
