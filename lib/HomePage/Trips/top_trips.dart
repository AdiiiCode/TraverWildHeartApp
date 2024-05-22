import 'package:flutter/material.dart';
import 'package:final_project_tourism/ReusesWidgets/trips_descriptions.dart';

class TopTrips extends StatefulWidget {
  final String name;

  const TopTrips(this.name, {super.key});

  @override
  State<TopTrips> createState() => _TopTripsState();
}

class _TopTripsState extends State<TopTrips> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5.0, bottom: 5.0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Descrip('assets/images/Mushk.jpeg', 'Mushkpuri Top NathiaGali', 'Click Here For details', 'Musk', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Tolipeer.jpg', 'Tolipeer Top Azad Kashmir', 'Click Here For details','Toli', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Hunnzaa.jpg', 'Hunza Valley Gilgit Baltistan', 'Click Here For details','Hunza', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Swatt.jpg', 'Swat Valley KPK', 'Click Here For details','Swat', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Babusar.jpg', 'Babusar Top KPK', 'Click Here For details','Babusar', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Warr.jpg', 'Warwan Valley Azad Kashmir', 'Click Here For details','Warr', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Ban.jpg', 'Banjusa Lake Azad Kashmir', 'Click Here For details','Banjusa', widget.name),
                const SizedBox(
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
