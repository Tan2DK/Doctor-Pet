import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomSearchBarWidget extends StatefulWidget {
  const CustomSearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSearchBarWidget> createState() =>
      _CustomSearchBarWidgetState();
}

class _CustomSearchBarWidgetState
    extends State<CustomSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
