import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather_pages/search_app.dart';
import 'package:weather_repository/weather_repository.dart';

import 'weather_pages/settings/settings.dart';
import 'weather_pages/weather/weather.dart';

typedef OnChangeTitle = void Function(String newTitle);

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerPage(),
    );
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _selectedIndex = 0;

  void _onItemTapped(String title) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(
                SettingsPage.route(
                  context.read<WeatherCubit>(),
                ),
              );
            },
          ),
        ],
      ),
      body: WeatherApp(
        weatherRepository: WeatherRepository(),
        onChangeTitle: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              selected: _selectedIndex == 0,
              title: const Text('Search'),
              onTap: () {
                _onItemTapped('Search');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped('History');
                Navigator.pop(context);
              },
            ),
            ListTile(
              selected: _selectedIndex == 2,
              title: const Text('Maps'),
              onTap: () {
                _onItemTapped('Maps');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
