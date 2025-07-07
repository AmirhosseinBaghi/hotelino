import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenShower extends StatefulWidget {
  final String imageUrl;
  const FullScreenShower({super.key, required this.imageUrl});

  @override
  State<FullScreenShower> createState() => _FullScreenShowerState();
}

class _FullScreenShowerState extends State<FullScreenShower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
            enableRotation: false,
            initialScale: PhotoViewComputedScale.contained * 1,
            backgroundDecoration: BoxDecoration(color: Colors.black),
            imageProvider: NetworkImage(networkUrl(widget.imageUrl))),
      ),
    );
  }
}
