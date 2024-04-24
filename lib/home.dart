import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        actions: [
          MouseRegion(
            child: Tooltip(
              message: 'Click to view events',
              child: IconButton(
                onPressed: () {
                  // Add onPressed logic here
                },
                icon: const Icon(Icons.event),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          MouseRegion(
            child: Tooltip(
              message: 'Click to Contact Us',
              child: IconButton(
                onPressed: () {
                  // Add onPressed logic here
                },
                icon: const Icon(Icons.phone),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'history',
                child: Text('History'),
              ),
              const PopupMenuItem<String>(
                value: 'billings',
                child: Text('Billings'),
              ),
            ],
            onSelected: (String value) {
              switch (value) {
                case 'profile':
                  break;
                case 'history':
                  break;
                case 'billings':
                  break;
              }
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'ASA Travels',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Top Trips Today',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 5.0, bottom: 5.0),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'images/Mushk.jpeg',
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Mushkpuri Top NathiaGali",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Click Here For details",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                  SizedBox(
                    width: 50,
                  ),
                  Text('abcd'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
