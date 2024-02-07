import 'package:flutter/material.dart';
import 'package:finki/model/list_item.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  static const routeName = '/calendar';

  @override
  Widget build(BuildContext context) {
    final items = ModalRoute.of(context)
    !.settings.arguments as List<ListItem>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        //view: CalendarView.week,
        dataSource: MeetingDataSource(getAppointments(items)),

      ),
    );
  }
}

List<Appointment> getAppointments(List<ListItem> items){
  List<Appointment> meetings = <Appointment>[];
  for (var element in items) {
    meetings.add(Appointment(
      startTime: element.date,
      endTime: element.date.add(const Duration(hours: 2)),
      subject: element.title,
      color: Colors.pink,
    ));
  }
  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source){
    appointments = source;
  }
}