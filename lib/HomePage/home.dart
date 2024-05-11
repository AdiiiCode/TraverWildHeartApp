import 'package:final_project_tourism/ChatBot/ChatPage.dart';
import 'package:final_project_tourism/HomePage/SliderPage/Slider.dart';
import 'package:final_project_tourism/HomePage/Trips/PremiumTrips.dart';
import 'package:final_project_tourism/HomePage/Trips/TopTrips.dart';
import 'package:final_project_tourism/HomePage/Trips/WeeklyTrips.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Wrap the Scaffold with GestureDetector
      onTap: () {
        // Hide keyboard when tapped outside of any text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/profile.png',
                width: 50,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                  width: 250,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Destination',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.widgets),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(28),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SliderPage(),
              SizedBox(height: 10),
              PremiumTrips(),
              SizedBox(height: 20),
              WeeklyTrips(),
              SizedBox(height: 20),
              TopTrips(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 400,
                  color: Colors.white,
                  child: ChatScreen(),
                );
              },
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
