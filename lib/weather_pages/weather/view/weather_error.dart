import 'package:flutter/material.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({
    required this.errorMessage,
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'City does not exist',
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
