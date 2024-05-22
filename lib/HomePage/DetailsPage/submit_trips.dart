// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_tourism/PaymentPage/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project_tourism/ChatBot/chat_page.dart';

class SubmitTrip extends StatefulWidget {
  final String name;
  final String price;
  final String tripname;
  const SubmitTrip(this.tripname, this.price, this.name, {super.key});

  @override
  State<SubmitTrip> createState() => _SubmitTripState();
}

class _SubmitTripState extends State<SubmitTrip> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController passengers = TextEditingController();
  final TextEditingController destination = TextEditingController();
  final TextEditingController price = TextEditingController();
  bool _isSearching = false;
  String? userId;

  @override
  void initState() {
    super.initState();
    fullName.text = widget.name;
    destination.text = widget.tripname;
    price.text = widget.price;
    _getUserId();
  }

  Future<void> _getUserId() async {
    try {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection('users')
          .where('username', isEqualTo: widget.name)
          .get();
      if (query.docs.isNotEmpty) {
        setState(() {
          userId = query.docs.first.id;
        });
      }
    } catch (e) {
      //
    }
  }

  Future<void> _submitForm() async {
    if (userId == null) return;
    try {
      await FirebaseFirestore.instance
          .collection('TripData')
          .add({
        'FullName': fullName.text,
        'email': email.text,
        'PhoneNumber': phonenumber.text,
        'Persons': int.parse(passengers.text),
        'destination': destination.text,
        'price': price.text,
        'PaymentMethod': 'Card',
        'userId': userId,
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(passengers.text,widget.name)));
    } catch (e) {
      //
      //
    }
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
                          hintText: 'Destination',
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
                          'Proceed To Payment',
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
