import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:flutter/foundation.dart';

class UserFilterProvider extends ChangeNotifier {
  final Set<StatusFilter> _selectedFilters = <StatusFilter>{};

  void toggleFilter(StatusFilter filter) {
    if (_selectedFilters.contains(filter)) {
      _selectedFilters.remove(filter);
    } else {
      _selectedFilters.add(filter);
    }
    notifyListeners();
  }

  bool isFilterSelected(StatusFilter filter) {
    return _selectedFilters.contains(filter);
  }

  bool isFilterEmpty() {
    return _selectedFilters.isEmpty;
  }
}
