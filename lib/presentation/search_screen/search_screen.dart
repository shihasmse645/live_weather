import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/home_screen/home_screen_bloc.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Please enter something to search,'),
          )
        ],
      );
    }
    context.read<HomeScreenBloc>().add(FetchData(querry: query));
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        final searchResult = state.searchResult;
        return Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              scrollDirection: Axis.vertical,
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                final result = searchResult.entries.elementAt(index);
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(result.key.toString()),
                    trailing: Text(result.value.toString()),
                  ),
                );
              }),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Please enter something to search,'),
    );
  }
}
