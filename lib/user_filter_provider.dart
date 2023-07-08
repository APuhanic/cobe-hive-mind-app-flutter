import 'package:flutter/foundation.dart';

class UserFilterProvider extends ChangeNotifier {
  final Set<String> _selectedFilters = <String>{};

  void toggleFilter(String filter) {
    if (_selectedFilters.contains(filter)) {
      _selectedFilters.remove(filter);
    } else {
      _selectedFilters.add(filter);
    }
    notifyListeners();
  }

  bool isFilterSelected(String filter) {
    return _selectedFilters.contains(filter);
  }

  bool isFilterEmpty() {
    return _selectedFilters.isEmpty;
  }
}
