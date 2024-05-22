// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tourism/HomePage/BookHotels.dart/greetings_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project_tourism/ChatBot/chat_page.dart';

class SubmitHotel extends StatefulWidget {
  final String name;
  final String hotelName;
  final String hotelPrice;
  const SubmitHotel(this.name ,this.hotelName,this.hotelPrice,{super.key});

  @override
  State<SubmitHotel> createState() => _SubmitTripState();
}

class _SubmitTripState extends State<SubmitHotel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController passengers = TextEditingController();
  final TextEditingController destination = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController rooms = TextEditingController();

  bool _isSearching = false;
  late String roomtype;
  String? userId;

  @override
  void initState() {
    super.initState();
    fullName.text = widget.name;
    price.text = widget.hotelPrice;
    destination.text = widget.hotelName;
  }
  Future<void> _submitForm() async {
      await FirebaseFirestore.instance
          .collection('HotelBooking')
          .add({
        'FullName': fullName.text,
        'email': email.text,
        'PhoneNumber': phonenumber.text,
        'Persons': int.parse(passengers.text),
        'HotelName': destination.text,
        'price': price.text,
        'PaymentMethod': 'Card',
        'NumberofRooms': rooms.text,
        'RoomType': roomtype,
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ThankYouPage(widget.name)));
    } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
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
        child: Center(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Adeel Travelers',
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                    const Text(
                      'Travel and Explore with us',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: fullName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your username',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: phonenumber,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Phone',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: passengers,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.parse(value) < 1) {
                            return 'Passengers must be 1 or more';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Passengers',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: destination,
                        decoration: const InputDecoration(
                          hintText: 'Hotel Name',
                          prefixIcon: Icon(Icons.place),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: price,
                        decoration: const InputDecoration(
                          hintText: 'Enter price',
                          prefixIcon: Icon(Icons.money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: rooms,
                        decoration: const InputDecoration(
                          hintText: 'Number Of Rooms',
                          prefixIcon: Icon(Icons.money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                   SizedBox(
                width: 400,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'Select a value',
                    prefixIcon: Icon(Icons.list),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Text('Sigle Bed Room'),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('Double Bed Room'),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text('Childrens Room'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      roomtype = value!;
                    });
                  },
                ),
              ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const BeveledRectangleBorder(),
                          side: const BorderSide(
                              color: Colors.black, width: 0.2),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _submitForm();
                          }
                        },
                        child: const Text(
                          'Payment On Arrival',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
