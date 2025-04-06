import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/data/models/model.dart';

class HotelListSection extends StatelessWidget {
  final String title;
  final List<Hotel> hotels;
  final VoidCallback? onPressed;
  const HotelListSection(
      {super.key, required this.title, required this.hotels, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'مشاهده همه',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
            itemBuilder: (context, index) {},
          ),
        )
      ],
    );
  }
}
