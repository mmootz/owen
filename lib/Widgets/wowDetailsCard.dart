import 'package:flutter/material.dart';

class wowDetails extends StatelessWidget {
  const wowDetails(
      {Key? key,
      required this.wowCurrent,
      required this.wowTotal,
      required this.wowTimestamp})
      : super(key: key);

  final String wowCurrent;
  final String wowTotal;
  final String wowTimestamp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("Current movie wow: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(wowCurrent),
          ],
        ),
        Row(
          children: [
            const Text("Wow timestamp: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(wowTimestamp),
          ],
        ),
        Row(
          children: [
            const Text("Total wows in movie: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(wowTotal),
          ],
        )
      ],
    );
  }
}
