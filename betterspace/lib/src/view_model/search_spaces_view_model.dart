import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchSpacesViewModel with ChangeNotifier {
  DateTime _dateTime = DateTime.now();
  DateTime? _dateNow;
  String _datePicked = '';

 DateTime get dateTime => _dateTime;

  String get datePicked => _datePicked;

  DateTime get dateNow => _dateNow!;

  set dateNow(DateTime dateTime) {
    _dateNow = dateTime;
  }

  void pickdate() {
    if (_dateNow != null) {
      _dateTime = _dateNow!;
      _datePicked = DateFormat('EEEE, d MMMM y').format(_dateNow!);
      notifyListeners();
    }
  }
}
