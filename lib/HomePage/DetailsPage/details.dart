import 'package:final_project_tourism/ChatBot/chat_page.dart';
import 'package:final_project_tourism/HomePage/DetailsPage/submit_trips.dart';
import 'package:flutter/material.dart';

class DetailsTrips extends StatefulWidget {
  final String identifier;
  final String name;
  const DetailsTrips(this.identifier,this.name, {super.key});

  @override
  State<DetailsTrips> createState() => _DetailsTripsState();
}

class _DetailsTripsState extends State<DetailsTrips> {
  bool _isSearching = false;
  String getImagePath(String identifier) {
    // Define the logic to return the image path based on the identifier
    switch (identifier) {
      //Premium Packages
      case 'BabuPrem':
        return 'assets/images/download.jpeg';
      case 'ChitPrem':
        return 'assets/images/ChitralP.jpeg';
      case 'HunzaPrem':
        return 'assets/images/Hunza.jpeg';
      case 'KumratPrem':
        return 'assets/images/Kumrat.jpeg';
      case 'MurrePrem':
        return 'assets/images/MurreHills.jpeg';
      case 'SkarduPrem':
        return 'assets/images/SkarduP.jpeg';
      case 'FMPrem':
        return 'assets/images/FairyMeadows.jpeg';
      //Weekly Packages
      case 'Dol':
        return 'assets/images/dolmen.jpg';
      case 'Haw':
        return 'assets/images/Hawks.jpg';
      case 'Bin':
        return 'assets/images/BinQasim.jpg';
      case 'Moh':
        return 'assets/images/Mohatta.jpg';
      case 'Devils':
        return 'assets/images/Devils.jpg';
      case 'SB':
        return 'assets/images/SBPM.jpg';
      case 'Safari':
        return 'assets/images/Safari.jpg';
      //Top Daily Packages
      case 'Musk':
        return 'assets/images/Mushk.jpeg';
      case 'Toli':
        return 'assets/images/Tolipeer.jpg';
      case 'Hunza':
        return 'assets/images/Hunnzaa.jpg';
      case 'Swat':
        return 'assets/images/Swatt.jpg';
      case 'Babusar':
        return 'assets/images/Babusar.jpg';
      case 'Warr':
        return 'assets/images/Warr.jpg';
      default:
        return 'assets/images/Ban.png'; // Replace 'assets/default_image.png' with a default image path or handle other cases as needed
    }
  }

  String getDesCription(String identifier) {
    // Define the logic to return the image path based on the identifier
    switch (identifier) {
      //Premium Packages
      case 'BabuPrem':
        return 'Babusar Top is a mountain pass located in the Khyber Pakhtunkhwa province of Pakistan.';
      case 'ChitPrem':
        return 'Chitral is a district in the Khyber Pakhtunkhwa province of Pakistan, known for its stunning natural beauty and rich cultural heritage.';
      case 'HunzaPrem':
        return 'Hunza is a picturesque valley located in the Gilgit-Baltistan region of Pakistan, renowned for its breathtaking scenery, vibrant culture, and historical significance.';
      case 'KumratPrem':
        return 'Kumrat Valley is a scenic valley situated in the Upper Dir district of Khyber Pakhtunkhwa, Pakistan, celebrated for its lush greenery, meandering rivers, and serene ambiance.';
      case 'MurrePrem':
        return 'Murree is a popular hill station located in the Rawalpindi District of Punjab, Pakistan, renowned for its scenic beauty, pleasant climate, and tourist attractions.';
      case 'SkarduPrem':
        return 'Skardu is a picturesque town in Gilgit-Baltistan, Pakistan, serving as a gateway to the majestic Karakoram mountain range and the stunning Shigar and Khaplu valleys.';
      case 'FMPrem':
        return 'Fairy Meadows is a breathtakingly beautiful alpine meadow located in the Gilgit-Baltistan region of Pakistan, offering stunning views of Nanga Parbat, the world\'s ninth-highest mountain.';
      //Weekly Packages
      case 'Dol':
        return 'Dolmen refers to ancient stone structures found in various parts of the world, including Pakistan, serving as burial sites or ceremonial monuments constructed during the prehistoric era.';
      case 'Haw':
        return 'Hawksbay Beach is a popular beach located near Karachi, Pakistan, known for its sandy shores, clear waters, and opportunities for recreational activities such as swimming and picnicking.';
      case 'Bin':
        return 'Bin Qasim Port is a major seaport located in Karachi, Pakistan, facilitating trade and maritime activities in the region, named after the famous Muslim general, Muhammad bin Qasim.';
      case 'Moh':
        return 'The Mohatta Palace is a historical palace located in Karachi, Pakistan, renowned for its stunning architecture and cultural significance, serving as a museum and venue for various cultural events.';
      case 'Devils':
        return 'Devil\'s Point is a scenic viewpoint located in the Karchi, Pakistan, offering panoramic views of the surrounding mountains and valleys, popular among tourists for its stunning natural beauty.';
      case 'SB':
        return 'The State Bank Museum is located in Karachi, Pakistan, showcasing the history and evolution of banking in the country, including exhibits on currency, banking artifacts, and the role of the State Bank of Pakistan in the financial sector.';
      case 'Safari':
        return 'Safari Park is a recreational area located in Karachi, Pakistan, offering various attractions such as a zoo, botanical garden, and recreational facilities for visitors to enjoy nature and wildlife.';
      //Top Daily Packages
      case 'Musk':
        return 'Mushkpuri Top is a scenic peak located in the Nathiagali Hills of Abbottabad District, Khyber Pakhtunkhwa, Pakistan, offering breathtaking views of the surrounding valleys and mountains.';
      case 'Toli':
        return 'Tolipeer is a picturesque hilltop area located near Rawalakot in Azad Kashmir, Pakistan, renowned for its stunning panoramic views of the surrounding mountains and valleys.';
      case 'Hunza':
        return 'Hunza is a breathtaking valley in Gilgit-Baltistan, Pakistan, celebrated for its majestic mountains, vibrant culture, and rich history, attracting tourists from around the world.';
      case 'Swat':
        return 'Swat is a scenic valley in the Khyber Pakhtunkhwa province of Pakistan, known for its stunning natural beauty, lush greenery, and cultural heritage, often referred to as the "Switzerland of the East".';
      case 'Babusar':
        return 'Babusar Pass is a mountain pass in the Kaghan Valley of the Khyber Pakhtunkhwa province in Pakistan, known for its spectacular views and as a route connecting Gilgit-Baltistan with Khyber Pakhtunkhwa';
      case 'Warr':
        return 'Warwan is a remote valley located in the Kishtwar district of the Jammu region in the union territory of Jammu and Kashmir, India. It is known for its pristine natural beauty, high-altitude meadows, and cultural heritage.';
      default:
        return 'Banjusa is a picturesque area situated in the Skardu District of Gilgit-Baltistan, Pakistan, known for its scenic landscapes, including lush green fields, meandering rivers, and breathtaking mountain views.'; // Replace 'assets/default_image.png' with a default image path or handle other cases as needed
    }
  }

String getTitle(String identifier) {
    // Define the logic to return the image path based on the identifier
    switch (identifier) {
      //Premium Packages
      case 'BabuPrem':
        return 'Babusar Top Peak';
      case 'ChitPrem':
        return 'Chitral Valley';
      case 'HunzaPrem':
        return 'Hunza Valley';
      case 'KumratPrem':
        return 'Kumrat Valley';
      case 'MurrePrem':
        return 'Murre Hills';
      case 'SkarduPrem':
        return 'Skardu ';
      case 'FMPrem':
        return 'Fiery Meadows';
      //Weekly Packages
      case 'Dol':
        return 'Dolmen Karachi';
      case 'Haw':
        return 'HawksBay Beach';
      case 'Bin':
        return 'Bin Qasim Park';
      case 'Moh':
        return 'Mohatta Fort';
      case 'Devils':
        return 'Devils View Beach';
      case 'SB':
        return 'State Bank Mueseum';
      case 'Safari':
        return 'Safari Park';
      //Top Daily Packages
      case 'Musk':
        return 'Mushkpuri top ';
      case 'Toli':
        return 'Tolipeer';
      case 'Hunza':
        return 'Hunza Valley';
      case 'Swat':
        return 'Switzerland Of North';
      case 'Babusar':
        return 'Babusar Top';
      case 'Warr':
        return 'Warwan Valley';
      default:
        return 'Banjusa Lake'; // Replace 'assets/default_image.png' with a default image path or handle other cases as needed
    }
  }

String getPrice(String identifier) {
    switch (identifier) {
      //Premium Packages
      case 'BabuPrem':
        return 'Rs. 10,000/Person';
      case 'ChitPrem':
        return 'Rs. 15,000/Person';
      case 'HunzaPrem':
        return 'Rs. 20,000/Person';
      case 'KumratPrem':
        return 'Rs. 20,000/ 2 Persons';
      case 'MurrePrem':
        return 'Rs. 15,000/ 2 Persons';
      case 'SkarduPrem':
        return 'Rs. 30,000/Person ';
      case 'FMPrem':
        return 'Rs. 20,000/Person';
      //Weekly Packages
      case 'Dol':
        return 'Rs. 5,000/Person';
      case 'Haw':
        return 'Rs. 10,000/Person';
      case 'Bin':
        return 'Rs. 5,000/Person';
      case 'Moh':
        return 'Rs. 8,000/Person';
      case 'Devils':
        return 'Rs. 10,000/Person';
      case 'SB':
        return 'Rs. 5,000/Person';
      case 'Safari':
        return 'Rs. 10,000/Person';
      //Top Daily Packages
      case 'Musk':
        return 'Rs. 3500/Person ';
      case 'Toli':
        return 'Rs. 10,000/Person';
      case 'Hunza':
        return 'Rs. 30,000/Person';
      case 'Swat':
        return 'Rs. 20,000/Person';
      case 'Babusar':
        return 'Rs. 15,000/Person';
      case 'Warr':
        return 'Rs. 10,000/Person';
      default:
        return 'Rs. 30,000/Person';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200, // Set the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(getImagePath(widget.identifier)),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  getTitle(widget.identifier),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  getDesCription(widget.identifier),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(   
                      getPrice(widget.identifier),
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SubmitTrip(getTitle(widget.identifier), getPrice(widget.identifier),widget.name)));
                        },
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
