import 'package:flutter/material.dart';
import 'package:hotelino/feachures/home/presentation/provider/home_provider.dart';
import 'package:hotelino/feachures/home/presentation/widgets/home_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: HomeAppbar(),
      body: Center(),
    );
  }
}
