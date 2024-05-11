import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final List<String> images = [
    'images1.jpeg',
    'images2.jpeg',
    'images3.jpeg',
    'images4.jpeg',
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
    Timer.periodic(Duration(seconds: 4), (timer) {
      _changeImageAutomatically();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
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
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              _changeImage(index);
            },
            viewportFraction: 1.0,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
