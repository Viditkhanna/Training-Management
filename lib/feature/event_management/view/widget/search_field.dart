import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final textFieldWidth = isVisible ? totalWidth * 0.75 : totalWidth;
    return Stack(
      children: [
        AnimatedContainer(
          width: textFieldWidth,
          height: 32,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: TextField(
            onTap: () {
              if (isVisible) return;
              isVisible = true;
              setState(() {});
            },
            cursorHeight: 14,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              hintText: 'Search',
              filled: true,
              prefixIcon: Icon(Icons.search, size: 22, color: Colors.black45),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(4).copyWith(left: 8),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          right: isVisible ? 0 : -100,
          bottom: 0,
          top: 0,
          child: TextButton(
            onPressed: () {
              isVisible = false;
              setState(() {});
            },
            child: Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
