import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  String? _date;
  String? _time;

  final _dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: now.subtract(const Duration(days: 365)),
      initialDate: now,
      initialEntryMode: MediaQuery.of(context).accessibleNavigation
          ? DatePickerEntryMode.inputOnly
          : DatePickerEntryMode.calendar,
      lastDate: now.add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() => _date = _dateFormat.format(picked));
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: now,
      initialEntryMode: MediaQuery.of(context).accessibleNavigation
          ? TimePickerEntryMode.inputOnly
          : TimePickerEntryMode.dial,
    );

    if (picked != null) {
      setState(() => _time = picked.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date & Time picker')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_month),
              onTap: () => _selectDate(context),
              subtitle: const Text(
                'Will display a simpler dialog if user is using a screen reader',
              ),
              title: Text(_date ?? 'Select Date'),
            ),
            ListTile(
              leading: const Icon(Icons.alarm),
              onTap: () => _selectTime(context),
              subtitle: const Text(
                'Will display a simpler dialog if user is using a screen reader',
              ),
              title: Text(_time ?? 'Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}
