import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerListTile extends StatefulWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.falIcon,
    required this.press,
    this.dropdownItems,
    this.tileColor = Colors
        .transparent, required VoidCallback onTap, // Default to transparent to avoid affecting other parts
  });

  final String title;
  final IconData falIcon;
  final VoidCallback press;
  final List<String>? dropdownItems;
  final Color tileColor; // New parameter for tile color

  @override
  DrawerListTileState createState() => DrawerListTileState();
}

class DrawerListTileState extends State<DrawerListTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: widget.tileColor, // Apply the tile color
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ListTile(
              onTap: widget.dropdownItems == null
                  ? widget.press
                  : () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
              horizontalTitleGap: 20,
              leading: FaIcon(
                widget.falIcon,
                color: Colors.grey[500],
                size: 20,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(color: Colors.black87),
                  ),
                  if (widget.dropdownItems != null)
                    Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.grey[500],
                    ),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded && widget.dropdownItems != null)
          Column(
            children: widget.dropdownItems!.map((item) {
              return Container(
                color:
                    widget.tileColor, // Apply the tile color to dropdown items
                child: Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: ListTile(
                    title: Text(item),
                    onTap: () {
                      // Handle sub-item tap
                      print('Selected: $item');
                    },
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
