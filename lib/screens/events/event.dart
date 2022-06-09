import 'package:flutter/material.dart';

import '../../models/event.dart';

class EventDetail extends StatefulWidget {
  final Event event;
  const EventDetail({Key? key, required this.event}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(widget.event.title)),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.event.day.toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.event.month,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    )
                  ],
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.event.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const Divider(height: 20),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.event.hour, style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 5),
                    const Text(
                      'in 2 days',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 10),
                Text(
                  widget.event.location,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(widget.event.subtitle, style: const TextStyle(height: 1.8))
          ],
        ),
      ),
    );
  }
}
