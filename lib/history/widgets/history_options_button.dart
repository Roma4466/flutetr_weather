import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/history/bloc/history_bloc.dart';

enum HistoryOption { deleteAll }

class HistoryOptionsButton extends StatelessWidget {
  const HistoryOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final weathers = context.select((HistoryBloc bloc) => bloc.state.weathers);
    final hasWeathers = weathers.isNotEmpty;

    return PopupMenuButton<HistoryOption>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      tooltip: 'Options',
      onSelected: (options) {
        switch (options) {
          case HistoryOption.deleteAll:
            context.read<HistoryBloc>().add(const DeleteAll());
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: HistoryOption.deleteAll,
            enabled: hasWeathers,
            child: Text('Delete all'),
          ),
        ];
      },
      icon: const Icon(Icons.more_vert_rounded),
    );
  }
}
