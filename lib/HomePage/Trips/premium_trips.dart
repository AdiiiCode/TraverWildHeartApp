import 'package:final_project_tourism/ReusesWidgets/trips_descriptions.dart';
import 'package:flutter/material.dart';

class PremiumTrips extends StatefulWidget {
  final String name;
  const PremiumTrips(this.name, {super.key});

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
          padding: const EdgeInsets.only(
              left: 10, right: 10, top: 5.0, bottom: 5.0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Descrip('assets/images/download.jpeg', 'Babusar Top Mansehra KPK', 'Click Here For details', 'BabuPrem', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/ChitralP.jpeg', 'Chitral Gigit Baltistan', 'Click Here For details','ChitPrem', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Hunza.jpeg', 'Hunza Valley Gilgit Baltistan', 'Click Here For details','HunzaPrem', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/Kumrat.jpeg', 'Kumrat Valley KPK', 'Click Here For details','KumratPrem', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/MurreHills.jpeg', 'Murre Hills KPK', 'Click Here For details','MurrePrem', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/SkarduP.jpeg', 'Skardu Khyber Paktunkhwa', 'Click Here For details','SkarduPrem', widget.name),
                const SizedBox(
                  width: 20,
                ),
                Descrip('assets/images/FairyMeadows.jpeg', 'Fairy Meadows Azad Kashmir', 'Click Here For details','FMPrem', widget.name),
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
