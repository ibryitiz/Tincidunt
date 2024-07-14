import 'dart:async';

import 'package:flutter/material.dart';

class HomePageViewModel with ChangeNotifier {
  final String _lorem =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
          .toLowerCase()
          .replaceAll(',', "")
          .replaceAll('.', "");
  String get lorem => _lorem;

  int _step = 0;
  int _typedCharsLength = 0;
  int _lastTypedAt = 0;

  int get step => _step;
  int get typedCharsLength => _typedCharsLength;
  int get lastTypedAt => _lastTypedAt;
  set typedCharsLength(int value) {
    _typedCharsLength = value;
    notifyListeners();
  }

  set lastTypedAt(int value) {
    _lastTypedAt = value;
    notifyListeners();
  }

  set step(int value) {
    _step = value;
    notifyListeners();
  }

  void updateLastTypedAt() {
    _lastTypedAt = DateTime.now().millisecondsSinceEpoch;
  }

  void onType(String value) {
    updateLastTypedAt();
    String trimmedValue = _lorem.trimLeft();

    if (trimmedValue.indexOf(value) != 0) {
      _step = 2;
    } else {
      _typedCharsLength = value.length;
    }
    notifyListeners();
  }

  void onStartClick() {
    updateLastTypedAt();
    _step++;
    notifyListeners();

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        int now = DateTime.now().millisecondsSinceEpoch;
        //GAME OVER

        if (_step == 1 && now - _lastTypedAt > 4000) _step++;
        if (_step != 1) timer.cancel();
        notifyListeners();
      },
    );
  }

  Widget stateControle(
    Widget getStartedWidget,
    Widget testWidget,
    Widget gameOverWidget,
  ) {
    if (_step == 0) {
      return getStartedWidget;
    } else if (_step == 1) {
      return testWidget;
    } else {
      return gameOverWidget;
    }
  }
}
