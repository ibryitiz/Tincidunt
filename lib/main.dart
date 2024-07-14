import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tincidunt/firebase_options.dart';
import 'package:tincidunt/views/home_page/home_page_view.dart';
import 'package:tincidunt/views/home_page/home_page_view_model.dart';
import 'package:tincidunt/views/score_page/score_page_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomePageViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ScorePageViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
