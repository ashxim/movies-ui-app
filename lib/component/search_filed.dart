import 'package:flutter/material.dart';
import 'package:movies_ui_app/constants.dart';

class SearchBoxField extends StatefulWidget {
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final bool expandable;
  final ValueChanged<String> onChanged;

  const SearchBoxField({
    Key? key,
    this.borderRadius = 8.0,
    this.backgroundColor = Colors.white,
    this.expandable = false,
    required this.onChanged,
    required this.textColor,
  }) : super(key: key);

  @override
  _SearchBoxFieldState createState() => _SearchBoxFieldState();
}

class _SearchBoxFieldState extends State<SearchBoxField> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 320,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(
                  color: Constants.kWhiteColor
                      .withOpacity(0.6), // Set the label text color
                ),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search,
                    color: Constants.kWhiteColor.withOpacity(0.6)),
              ),
              onChanged: widget.onChanged,
            ),
          ),
          if (widget.expandable)
            IconButton(
              icon: Icon(Icons.mic,
                  color: Constants.kWhiteColor.withOpacity(0.6)),
              onPressed: () {
                // Handle microphone button press
              },
            ),
        ],
      ),
    );
  }
}
