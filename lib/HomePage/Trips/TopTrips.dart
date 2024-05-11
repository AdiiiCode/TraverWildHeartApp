import 'package:final_project_tourism/ReusesWidgets/TripsDescriptions.dart';
import 'package:flutter/material.dart';

class TopTrips extends StatefulWidget {
  const TopTrips({super.key});

  @override
  State<TopTrips> createState() => _TopTripsState();
}

class _TopTripsState extends State<TopTrips> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
const Text(
            'Top Trips Today',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all()
            // ),
            padding: const EdgeInsets.only(
                left: 10, right: 10, top: 5.0, bottom: 5.0),
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: const SingleChildScrollView(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Descrip('assets/images/Mushk.jpeg', 'Mushkpuri Top NathiaGali', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Tolipeer.jpg', 'Tolipeer Top Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Hunnzaa.jpg', 'Hunza Valley Gilgit Baltistan', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Swatt.jpg', 'Swat Valley KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Babusar.jpg', 'Babusar Top KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Warr.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Ban.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          )
      ],
    );
    
  }
}