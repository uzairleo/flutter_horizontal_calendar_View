import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Leo Date Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  var formattedTime;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  String formatedTime;

  @override
  void initState() {
    super.initState();
    setState(() {
      formatedTime = getMonth(_selectedValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            _controller.animateToSelection();
          },
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blueGrey[100],
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${this.formatedTime}",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                  ),
                  Container(
                    child: DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 80,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor:
                          Colors.blue.withOpacity(0.6), //Colors.transparent,
                      selectedTextColor: Colors.white, //Colors.black,
                      locale: "en_us",
                      monthTextStyle: TextStyle(color: Colors.transparent),
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;

                          formatedTime = getMonth(_selectedValue);
                        });
                      },
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   left: 140,
              //   top: 230,
              //   child: Opacity(
              //     opacity: 0.6,
              //     child: Container(
              //       width: 60,
              //       height: 80,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(12.0),
              //           color: Colors.blue.withOpacity(0.6)),
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }

  getMonth(value) {
    return DateFormat.MMMM().format(value);
  }
}
