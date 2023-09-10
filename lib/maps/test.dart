import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => _LocationPageState();
}

class _LocationPageState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Page")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('LAT: '),
              const Text('LNG: '),
              const Text('ADDRESS: '),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Get Current Location"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
