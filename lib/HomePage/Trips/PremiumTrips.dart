import 'package:final_project_tourism/ReusesWidgets/TripsDescriptions.dart';
import 'package:flutter/material.dart';

class PremiumTrips extends StatefulWidget {
  const PremiumTrips({super.key});

  @override
  State<PremiumTrips> createState() => _PremiumTripsState();
}

class _PremiumTripsState extends State<PremiumTrips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
const Text(
            'Premium Trips',
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
                  Descrip('assets/images/download.jpeg', 'Mushkpuri Top NathiaGali', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/ChitralP.jpeg', 'Tolipeer Top Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Hunza.jpeg', 'Hunza Valley Gilgit Baltistan', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/Kumrat.jpeg', 'Swat Valley KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/MurreHills.jpeg', 'Babusar Top KPK', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/SkarduP.jpeg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                  SizedBox(
                    width: 20,
                  ),
                  Descrip('assets/images/FairyMeadows.jpeg', 'Warwan Valley Azad Kashmir', 'Click Here For details'),
                
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