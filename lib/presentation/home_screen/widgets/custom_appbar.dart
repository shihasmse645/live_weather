import 'package:flutter/material.dart';

import '../../search_screen/search_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'WeatherNow',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 24,
            ),
          ),
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
    );
  }
}
