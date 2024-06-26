import 'package:final_project_tourism/ChatBot/chat_page.dart';
import 'package:final_project_tourism/HomePage/SliderPage/slider_page.dart';
import 'package:final_project_tourism/HomePage/Trips/premium_trips.dart';
import 'package:final_project_tourism/HomePage/Trips/top_trips.dart';
import 'package:final_project_tourism/HomePage/Trips/weekly_trips.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  final String name;
  const HomePage(this.name,{super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            // bottom: const BorderRadius.only(bottomLeft: Circular(5)),
            automaticallyImplyLeading: false,
            toolbarHeight: 100,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Hey, ${widget.name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (_isSearching)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(28),
                          ),
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search Destination',
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                          ),
                          autofocus: true,
                          onSubmitted: (_) {
                            // Handle search
                          },
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SliderPage(),
              const SizedBox(height: 10),
              PremiumTrips(widget.name), // Pass the name dynamically
              const SizedBox(height: 20),
              WeeklyTrips(widget.name),
              const SizedBox(height: 20),
              TopTrips(widget.name),
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
                  child: const ChatScreen(),
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
