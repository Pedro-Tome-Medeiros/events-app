import 'dart:convert';

import 'package:events/models/event.dart';
import 'package:events/screens/events/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late List<Event> _events;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _events = [];
    _loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Events"),
        ),
        body: ListView.builder(
            itemCount: _events.length,
            itemBuilder: (context, index) {
              final item = _events[index];
              final descriptionWidth = MediaQuery.of(context).size.width - 160;
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetail(event: item))),
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                                width: 100,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Text(item.month.toUpperCase(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                            Container(
                                height: 60,
                                alignment: Alignment.center,
                                child: Text(item.day.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30))),
                            Container(
                                width: 100,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Text(
                                  item.year.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: descriptionWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 15),
                            SizedBox(
                                width: 200,
                                child: Text(item.subtitle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis))
                          ],
                        ),
                      ),
                      const SizedBox(
                          width: 20, child: Icon(Icons.arrow_forward_ios)),
                    ],
                  ),
                ),
              );
            }));
  }

  Future<void> _loadEvents() async {
    final jsonText = await rootBundle.loadString('assets/data/events.json');
    _events =
        (json.decode(jsonText) as List).map((e) => Event.fromJson(e)).toList();
  }
}
