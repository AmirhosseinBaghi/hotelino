import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feachures/home/presentation/widgets/home_appbar.dart';
import 'package:hotelino/feachures/home/presentation/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
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
          ],
        ),
      ),
    );
  }
}
