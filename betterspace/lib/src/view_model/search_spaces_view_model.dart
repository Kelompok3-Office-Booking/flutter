import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  /// ------------------------------------------------------------------------

  /// feature filtering in search by selecting

  List foundAllOfficeBySelecting = [];

  List officeFilterBySelecting = OfficeViewModels().listOfAllOfficeModels;

  void filterAllOfficeBySelecting(context, String enteredKeyword) {
    final officeSearch = Provider.of<OfficeViewModels>(context, listen: false);
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = officeSearch.listOfAllOfficeModels;
    } else {
      results = officeSearch.listOfAllOfficeModels
          .where((place) =>
              place.officeLocation.city
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) &&
              place.officeType
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundAllOfficeBySelecting = results;
    notifyListeners();
  }

  /// ------------------------------------------------------------------------

  /// filtering search by keywoard

  List foundOffice = [];

  List officeListFilter = OfficeViewModels().listOfAllOfficeModels;

  void filterAllOffice(context, String enteredKeyword) {
    final officeSearch = Provider.of<OfficeViewModels>(context, listen: false);
    List results = [];
    if (enteredKeyword.isEmpty) {
      results = officeSearch.listOfAllOfficeModels;
    } else {
      results = officeSearch.listOfAllOfficeModels
          .where((place) =>
              (place.officeName
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase())) ||
              place.officeLocation.city
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              place.officeType
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundOffice = results;
    notifyListeners();
  }
}
