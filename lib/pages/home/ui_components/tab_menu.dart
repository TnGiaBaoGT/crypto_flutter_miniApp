import 'package:flutter/material.dart';

import '../../../model/tab/tab_data.dart';

class TabMenu extends StatefulWidget {
  const TabMenu({
    super.key,
    required this.tabdata,
  });

  final TabData tabdata;

  @override
  State<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var isSelected = true;
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.tabdata.tabData.length,
        itemBuilder: (context, index) {
          final data = widget.tabdata.tabData[index];
          isSelected = currentIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withOpacity(0.7) : null,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                  data.text
              ),
            ),
          );
        },),
    );
  }
}
