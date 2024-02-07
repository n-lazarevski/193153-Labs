import 'package:flutter/material.dart';
import 'package:finki/model/list_item.dart';
import 'package:finki/screens/calendar.dart';
import 'package:finki/screens/exam_details.dart';
import 'package:finki/screens/map_screen.dart';
import 'package:finki/widgets/subject_element.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _userItems = [
    ListItem(
        id: "T1",
        title: "Verojatnost i Statistika",
        date: DateTime.parse("2024-03-02 13:00")),
    ListItem(
        id: "T2",
        title: "Voved vo nauka na podatoci",
        date: DateTime.parse("2024-03-02 13:00")),
  ];

  void _addItemFunction(BuildContext ct) {
    // var newElement = ListItem(id: "T1", naslov: "Test 1", datum: "13");
    //
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              child: SubjectElement(_addNewItemToList),
              behavior: HitTestBehavior.opaque);
        });
  }

  void _addNewItemToList(ListItem item) {
    setState(() {
      _userItems.add(item);
    });
  }

  void _deleteItem(String id) {
    setState(() {
      _userItems.removeWhere((elem) => elem.id == id);
    });
  }

  void ShowDetails(BuildContext context, ListItem item) {
    /* Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ExamDetailScreen(item)),
      );*/
    Navigator.of(context)
        .pushNamed(ExamDetailScreen.routeName, arguments: item);
  }

  void ShowCalendar(BuildContext context, List<ListItem> items) {
    Navigator.of(context).pushNamed(CalendarScreen.routeName, arguments: items);
  }

  Widget _createBody() {
    return Center(
      child: _userItems.isEmpty
          ? Text("Nema ispiti")
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    title: Text(_userItems[index].title),
                    subtitle: Text(_userItems[index].date.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteItem(_userItems[index].id),
                    ),
                  ),
                );
              },
              itemCount: _userItems.length,
            ),
    );
  }

  PreferredSizeWidget _createAppBar() {
    return AppBar(
        // The title text which will be shown on the action bar
        title: Text("Termini za ispiti"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addItemFunction(context),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _createAppBar(),
        body: _createBody(),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () => ShowCalendar(context, _userItems),
            tooltip: 'Kalendar',
            child: const Icon(Icons.calendar_today),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: Icon(Icons.map),
            onPressed: () => ShowMap(context, _userItems),
            tooltip: 'Mapa',
          )
        ]));
  }
}

void ShowMap(BuildContext context, List<ListItem> items) {
  Navigator.of(context).pushNamed(MapScreen.routeName, arguments: items);
}
