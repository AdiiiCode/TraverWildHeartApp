import 'package:flutter/material.dart';
import 'package:final_project_tourism/ReusesWidgets/trips_descriptions.dart';

class WeeklyTrips extends StatefulWidget {
  final String name;

  const WeeklyTrips(this.name, {super.key});

  @override
  State<WeeklyTrips> createState() => _WeeklyTripsState();
}

class _WeeklyTripsState extends State<WeeklyTrips> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Weekly Trips',
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
                Descrip('assets/images/dolmen.jpg', 'Dolmen Builds Sindh', 'Click Here For details', 'Dol', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Hawks.jpg', 'Hawks Bay Beach Karachi', 'Click Here For details', 'Haw', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/BinQasim.jpg', 'BinQasim Fort Gawadar Sindh', 'Click Here For details', 'Bin', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Mohatta.jpg', 'Mohatta Sindh', 'Click Here For details', 'Moh', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Devils.jpg', 'Devils Spot Beach Karachi', 'Click Here For details', 'Devils', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/SBPM.jpg', 'Stat Bank Mueseum Karachi', 'Click Here For details', 'SB', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Safari.jpg', 'Safari Park Karachi', 'Click Here For details', 'Safari', widget.name),
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
