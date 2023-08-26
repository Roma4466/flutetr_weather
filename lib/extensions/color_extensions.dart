import 'dart:ui';

extension BrightenExtension on Color{
  Color brighten([int percent = 10]) {
    assert(
    1 <= percent && percent <= 100,
    'percentage must be between 1 and 100 but was $percent',
    );
    final p = percent / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }

  Color blurred([double percent = 0.1]) {
    final p = 0.5 + percent / 2;
    return Color.fromARGB(
      alpha,
      (red * p).round(),
      (green * p).round(),
      (blue * p).round(),
    );
  }
}