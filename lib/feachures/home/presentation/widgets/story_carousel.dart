import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';

class StoryCarousel extends StatefulWidget {
  final List<String> images;
  final List<String> title;
  const StoryCarousel({super.key, required this.images, required this.title});

  @override
  State<StoryCarousel> createState() => _StoryCarouselState();
}

class _StoryCarouselState extends State<StoryCarousel> {
  int _currentIndex = 0;
  late Timer _timer;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        if (_currentIndex < widget.images.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
        _carouselController.animateToPage(_currentIndex);
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _nextImage() {
    setState(() {
      if (_currentIndex < widget.images.length) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _carouselController.animateToPage(_currentIndex);
    });
  }

  void _prevImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = widget.images.length - 1;
      }
      _carouselController.animateToPage(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Stack(
        children: [
          CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlay: false,
                height: 250,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: widget.images.map(
                (imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          networkUrl(imageUrl),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.black.withValues(alpha: 0.75),
                                Colors.transparent
                              ])),
                        )
                      ],
                    ),
                  );
                },
              ).toList()),
          Positioned(
              top: 16,
              right: 0,
              left: 0,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: List.generate(
                      widget.images.length,
                      (index) {
                        return Expanded(
                            child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: 4,
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              color: _currentIndex >= index
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10)),
                        ));
                      },
                    ),
                  ))),
          Positioned(
            right: 8,
            top: 100,
            bottom: 100,
            child: GestureDetector(
              onTap: _nextImage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.6),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 100,
            bottom: 100,
            child: GestureDetector(
              onTap: _prevImage,
              child: CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.6),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
              right: 16,
              bottom: 16,
              child: Text(
                widget.title[_currentIndex],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
