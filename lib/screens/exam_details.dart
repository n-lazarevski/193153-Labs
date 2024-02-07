import 'package:flutter/material.dart';
import 'package:finki/model/list_item.dart';

class ExamDetailScreen extends StatelessWidget {
  static const routeName = '/exam_detail';



  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as ListItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(children: [
        Text(item.title),
        Text(item.date.toString()),
        Text(item.id),
      ]),
    );
  }
}