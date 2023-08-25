import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/history/bloc/history_bloc.dart';
import 'package:flutter_weather/history/models/history_view_filter.dart';

class HistoryFilterButton extends StatelessWidget {
  const HistoryFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final activeFilter =
        context.select((HistoryBloc bloc) => bloc.state.filter);

    return PopupMenuButton<HistoryViewFilter>(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      initialValue: activeFilter,
      tooltip: 'Filter',
      onSelected: (filter) {
        context.read<HistoryBloc>().add(HistoryFilterChanged(filter));
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: HistoryViewFilter.byDate,
            child: Text('By date'),
          ),
          PopupMenuItem(
            value: HistoryViewFilter.byDateDesc,
            child: Text('By date descending'),
          ),
          PopupMenuItem(
            value: HistoryViewFilter.byName,
            child: Text('By name'),
          ),
          PopupMenuItem(
            value: HistoryViewFilter.byNameDesc,
            child: Text('By name descending'),
          ),
        ];
      },
      icon: const Icon(Icons.filter_list_rounded),
    );
  }
}
