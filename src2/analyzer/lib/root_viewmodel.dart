import 'utils/enums.dart';

import 'package:flutter/foundation.dart';

class RootViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  late AppStatus _appState;
  late String _appStateString;

  RootViewModel() {
    _appState = AppStatus.splash;
    _appStateString = "Result";
  }
}
