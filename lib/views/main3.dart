import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final today = DateUtils.dateOnly(DateTime.now());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalendarDatePicker2 Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('zh', '')],
      home: const MyHomePage(title: 'CalendarDatePicker2 Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(2026, 6, 17),
    DateTime(2026, 6, 18),
  ];


  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > 1000) {
        // ignore: avoid_print
        print('scrolling distance: ${_scrollController.offset}');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                _buildScrollRangeDatePickerWithValue(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getValueText(
      CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,
      ) {
    values = values
        .map((e) => e != null ? DateUtils.dateOnly(e) : null)
        .toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  // TODO 123
  Widget _buildScrollRangeDatePickerWithValue() {
    final config = CalendarDatePicker2Config(
      centerAlignModePicker: true,
      calendarType: CalendarDatePicker2Type.range,
      calendarViewMode: CalendarDatePicker2Mode.scroll,
      rangeBidirectional: true,
      selectedDayHighlightColor: Colors.teal[800],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dynamicCalendarRows: true,
      weekdayLabelBuilder: ({required weekday, isScrollViewTopHeader}) {
        if (weekday == DateTime.wednesday && isScrollViewTopHeader != true) {
          return const Center(
            child: Text(
              'W',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          );
        }
        return null;
      },
      modePickerTextHandler: ({required monthDate, isMonthPicker}) {
        if (isMonthPicker ?? false) {
          return '${getLocaleShortMonthFormat(const Locale('en')).format(monthDate)} New';
        }

        return null;
      },
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),

    );
    return SizedBox(
      width: 375,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text('Scroll Range Date Picker'),
          SizedBox(
            height: 800,
            // TODO 123
            child: CalendarDatePicker2(
              config: config,
              value: _rangeDatePickerValueWithDefaultValue,
              onValueChanged: (dates) =>
                  setState(() => _rangeDatePickerValueWithDefaultValue = dates),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Selection(s):  '),
              const SizedBox(width: 10),
              Text(
                _getValueText(
                  config.calendarType,
                  _rangeDatePickerValueWithDefaultValue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }


}
