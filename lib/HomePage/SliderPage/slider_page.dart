import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final List<String> images = [
    'images1.jpg',
    'images2.jpg',
    'images3.jpg',
    'images4.jpg',
    'images5.jpeg',
    'images6.jpeg',
    'images7.jpeg',
  ];
  int _currentImageIndex = 0;

  // Function to change image
  void _changeImage(int index) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  // Function to change image automatically
  void _changeImageAutomatically() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % images.length;
    });
  }

  @override
  void initState() {
    super.initState();
    // Start changing image automatically every 4 seconds
    Timer.periodic(const Duration(seconds: 4), (timer) {
      _changeImageAutomatically();
    });
  }

  @override
Widget build(BuildContext context) {
  return Column(
    children: [
      Stack(
        children: [
          CarouselSlider(
            items: images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.asset(
                      'Slider/$image',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 300,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                _changeImage(index);
              },
              viewportFraction: 1.0,
            ),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'Explore The Nature With Us',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const BeveledRectangleBorder()
                  ),
                  child: const Text('Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

}
