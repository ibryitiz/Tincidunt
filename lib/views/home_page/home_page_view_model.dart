import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tincidunt/models/user_model.dart';
import 'package:tincidunt/repositories/firestore_repositories.dart';

class HomePageViewModel with ChangeNotifier {
  late TextEditingController _controller;
  HomePageViewModel() {
    _controller = TextEditingController();
  }

  final FirestoreRepositories _firestoreRepositories = FirestoreRepositories();

  void addUser(int score) {
    try {
      if (_controller.text.isNotEmpty) {
        UserModel userModel = UserModel(name: _controller.text, score: score);
        _firestoreRepositories.addUsersFromService(userModel);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  final String _lorem =
      "adapt add addict address adjust admit adult advance advice aerobic affair afford afraid again age agent agree ahead aim air airport aisle alarm album alcohol alert alien align alive all alley allocate allow almost alone alpha already also alter always amateur amazing among amount analyst anchor ancient anger angle angry animal ankle announce annual another answer antenna antique anxiety any apart apologize appeal appear apple approve april arch arctic area arena argue arm armed armor army around arrange arrest arrive arrow art artefact artist artwork ask asleep aspect assault asset assist assume asthma athlete atom attack attend attitude attract auction audit august aunt author auto autumn average avocado avoid awake award aware away awesome awful awkward axis baby bachelor bacon badge bag balance ball balloon bamboo banana banner bar barely barrel base basic basket battle beach bean bear beast beat beauty because become bed bedroom bee beef beer before begin behave behind believe below belt bench benefit best betray better between beyond bicycle bid big bike bind biology bird birth birthday bit bite bitter black blade blame blanket blast bleak bless blind block blood blossom blouse blow blue blur blush board boat body boil bomb bone bonus book boost boot border born borrow boss both bottle bottom bounce bound bowl box boy bracket brain brave bread break breakfast breast breath breathe brick bride bridge brief bright brilliant bring brisk broad broken bronze brother brown brush bubble bucket budget buffalo build building bullet bunch burn burst bury bus business busy butter button buy buzz cabbage cabin cable cake calculate call calm camera camp campaign can campus can canal cancel candy cannon canoe capable capital captain capture car carbon card care career careful cargo carpet carry cart cartoon case cash casino cast castle casual cat catalog catch category cause caution cave cease cedar ceiling celebrate cell cement census century cereal certain chair chalk challenge chamber champion chance change chaos chapter charge chase chat cheap check cheese chef cherry chest chew chicken chief child chimney choice choose chronic chuckle chunk churn cigar cinnamon circle citizen city civil claim clap clarify clash classic classroom clause clean clear clever click client cliff climb clinic clip clock close cloth cloud clown club clump cluster coach coast coat code coffee coil coin cold collapse collar collect college collide colonial color column combine comedy comfort comic common company concert conduct confirm confuse congress connect consider control convince cook cool copper copy coral core corn corner correct cost cotton couch country couple course court cousin cover coyote crack cradle craft cram crane crash crater crawl crazy cream creator credit creek cricket crime crisp critic crop cross crouch crowd crucial cruel cruise crumble crunch crush cry crystal cube culture cup cupboard curious current curtain curve cushion custom cute cycle dad damage damp dance danger daring dash daughter dawn day deal debate debris decade december decide decline decorate decrease deer defense define defy degree delay deliver demand demise deny depart depend deposit depth deputy derive describe desert design desk despair destroy detail detect develop device devote diagram dial diamond diary dice diesel diet differ digital dignity dilemma dinner dinosaur direct dirt disagree discover disease dish dismiss disorder display distance divert divide divine diving dizzy doctor document dodge dog doll dolphin domain donate door double doubt dove down downhill downtown dragon drain drama drastic draw dream dress drift drill drink drip drive drop drum dry duck dumb during dust dutch duty dwarf dynamic eager eagle early earn earth easily east easy echo ecology";
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

  TextEditingController get controller => _controller;
}
