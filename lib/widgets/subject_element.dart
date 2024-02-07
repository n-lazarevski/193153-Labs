import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:finki/model/list_item.dart';

import 'adaptive_flat_button.dart';

class SubjectElement extends StatefulWidget {
  final Function addItem;

  SubjectElement(this.addItem);

  @override
  State<StatefulWidget> createState() => _SubjectElementState();
}

class _SubjectElementState extends State<SubjectElement> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();

  late String title;
  late DateTime date;

  void _submitData() {
    if (_dateController.text.isEmpty) {
      return;
    }
    final titleValue = _titleController.text;
    final titleDate = _dateController.text;

    if (titleValue.isEmpty || titleDate.isEmpty) {
      return;
    }

    final newItem = ListItem(
        id: nanoid(5), title: titleValue, date: DateTime.parse(titleDate));
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
          TextField(
          controller: _titleController,
          decoration: InputDecoration(labelText: "Predmet"),
          onSubmitted: (_) => _submitData(),
        ),
          TextField(
            controller: _dateController,
            decoration: InputDecoration(labelText: "Datum", hintText: "yyyy-mm-dd hh:mm:ss"),
            keyboardType: TextInputType.datetime,
            onSubmitted: (_) => _submitData(),
        ),
        AdaptiveFlatButton("Dodadi ispit", _submitData)
    ],
    ),
    );
  }
}
