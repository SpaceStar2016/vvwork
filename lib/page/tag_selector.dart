import 'package:flutter/material.dart';
class TagSelector extends StatefulWidget {
  const TagSelector({super.key});

  @override
  _TagSelectorState createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  List<String> selectedTags = [];

  final List<String> allTags = [
    '雅思听力',
    '雅思写作',
    '雅思阅读',
    '雅思口语',
    '四六级',
    '自定义标签',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: allTags.map((tag) {
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
        SizedBox(height: 16.0),
        Text('Selected Tags: ${selectedTags.join(', ')}'),
      ],
    );
  }
}