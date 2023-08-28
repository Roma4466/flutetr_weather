import 'package:flutter/cupertino.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    required this.iconUrl,
    required double iconSize,
  }) : _iconSize = iconSize;

  final double _iconSize;

  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'http://openweathermap.org/img/w/04d.png',
      width: _iconSize,
      height: _iconSize,
      fit: BoxFit.cover,
    );
  }
}
