import 'package:flutter/material.dart';
class TagSelector extends StatefulWidget {

  TagSelector({required this.allTags ,super.key});

  final ValueNotifier<List<String>> allTagsNo = ValueNotifier<List<String>>([]);

  List<String> allTags = [];


  @override
  _TagSelectorState createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: widget.allTags.map((tag) {
            return ChoiceChip(
              label: Text(tag),
              selected: selectedTags.contains(tag),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedTags.add(tag);
                  } else {
                    selectedTags.remove(tag);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16.0),
        Text('Selected Tags: ${selectedTags.join(', ')}'),
      ],
    );
  }
}