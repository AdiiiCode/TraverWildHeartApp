import 'package:final_project_tourism/ReusesWidgets/TripsDescriptions.dart';
import 'package:flutter/material.dart';

class WeeklyTrips extends StatefulWidget {
  const WeeklyTrips({super.key});

  @override
  State<WeeklyTrips> createState() => _WeeklyTripsState();
}

class _WeeklyTripsState extends State<WeeklyTrips> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
const Text(
            'Weekly Trips',
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
                  Descrip('assets/images/dolmen.jpg', 'Mushkpuri Top NathiaGali', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Hawks.jpg', 'Tolipeer Top Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/BinQasim.jpg', 'Hunza Valley Gilgit Baltistan', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Mohatta.jpg', 'Swat Valley KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Devils.jpg', 'Babusar Top KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/SBPM.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Safari.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
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