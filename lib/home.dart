import 'package:final_project_tourism/ReusesWidgets/TripsDescriptions.dart';
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
            decoration: BoxDecoration(
              border: Border.all()
            ),
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 5.0, bottom: 5.0),
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: const SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Descrip('images/Mushk.jpeg', 'Mushkpuri Top NathiaGali', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('images/Tolipeer.jpg', 'Tolipeer Top Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('images/Hunnzaa.jpg', 'Hunza Valley Gilgit Baltistan', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('images/Swatt.jpg', 'Swat Valley KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('images/Babusar.jpg', 'Babusar Top KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('images/Warr.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('images/Ban.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
