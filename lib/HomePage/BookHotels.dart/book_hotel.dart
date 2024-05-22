import 'package:final_project_tourism/ChatBot/chat_page.dart';
import 'package:final_project_tourism/HomePage/BookHotels.dart/hotel_card.dart';
import 'package:final_project_tourism/HomePage/BookHotels.dart/reserve_hotel.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatefulWidget {
final String name;
   const HotelPage(this.name,{super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
    bool _isSearching = false;
  final List<Hotel> hotels = [
    Hotel(
      name: 'The Avari Hotel',
      description: 'Luxurious rooms with a beautiful view.',
      imageUrl: 'Hotels/avari.jpg',
      price: '10,000 Rs / Night',
    ),
    Hotel(
      name: 'The 108 Hotel',
      description: 'Convenient location with modern amenities.',
      imageUrl: 'Hotels/avari.jpg',
      price: '8,000 Rs / Night',

    ),
    Hotel(
      name: 'The 4 Points Hotel',
      description: 'Panaromic View And Luxury Rooms',
      imageUrl: 'Hotels/4pionts.jpg',
      price: '15,000 Rs / Night',

    ),
    // Add more hotels as needed
  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            final hotel = hotels[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitHotel(widget.name, hotel.name, hotel.price)));
              },
              child: HotelCard(hotel: hotel));
          },
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
    );
  }
}

class Hotel {
  final String name;
  final String description;
  final String imageUrl;
final String price;
  Hotel({required this.name, required this.description, required this.imageUrl, required  this.price});
}
