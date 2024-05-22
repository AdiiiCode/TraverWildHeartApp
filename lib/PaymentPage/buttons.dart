import 'package:final_project_tourism/ChatBot/chat_page.dart';
import 'package:final_project_tourism/HomePage/BookHotels.dart/book_hotel.dart';
import 'package:final_project_tourism/HomePage/home.dart';
import 'package:flutter/material.dart';

class ChooseUsers extends StatefulWidget {
  final String name;
  const ChooseUsers(this.name,{super.key});

  @override
  State<ChooseUsers> createState() => _ChooseUsersState();
}

class _ChooseUsersState extends State<ChooseUsers> {
  bool _isSearching = false;
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
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                            SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const BeveledRectangleBorder(),
                        side: const BorderSide(color: Colors.black, width: 0.2),
                      ),
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(widget.name)));
                      },
                      child:  const Text(
                            'Go To Home Page',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                    ),
                  ),
        
                  const SizedBox(height: 20,),
        
                                   SizedBox(
                    width: 400,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const BeveledRectangleBorder(),
                        side: const BorderSide(color: Colors.black, width: 0.2),
                      ),
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> HotelPage(widget.name)));
                       
                      },
                      child:  const Text(
                            'Book A Hotel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                    ),
                  ),
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
    );
  }
}