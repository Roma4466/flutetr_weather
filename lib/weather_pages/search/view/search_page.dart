import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_weather/weather_pages/search/bloc/search_bloc.dart';
import 'package:weather_repository/weather_repository.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  static Route<String> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => SearchBloc(
          weatherRepository: context.read<WeatherRepository>(),
        )..add(SuggestionsRequested()),
        child: SearchPage(),
      ),
    );
  }

  void _submit(BuildContext context) {
    final cleanedText = _text.replaceAll(RegExp(r'\s+'), '');
    Navigator.of(context).pop(cleanedText);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('City Search')),
        body: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TypeAheadField<String>(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'City',
                      hintText: 'Chicago',
                    ),
                    onSubmitted: (String value) {
                      _submit(context);
                    },
                  ),
                  suggestionsCallback: (String pattern) {
                    return state.suggestions
                        .where((suggestion) => suggestion
                            .toLowerCase()
                            .contains(pattern.toLowerCase()))
                        .toList();
                  },
                  itemBuilder: (BuildContext context, String suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    _textController.text = suggestion;
                  },
                ),
              ),
            ),
            IconButton(
              key: const Key('searchPage_search_iconButton'),
              icon: const Icon(Icons.search, semanticLabel: 'Submit'),
              onPressed: () => _submit(context),
            )
          ],
        ),
      );
    });
  }
}
