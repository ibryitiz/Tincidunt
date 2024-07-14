import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tincidunt/components/my_button.dart';
import 'package:tincidunt/components/my_marquee_text.dart';
import 'package:tincidunt/components/my_textfield.dart';
import 'package:tincidunt/components/my_user_name_textfield.dart';
import 'package:tincidunt/views/home_page/home_page_view_model.dart';
import 'package:tincidunt/views/score_page/score_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: _buildAppbar,
      drawer: const _MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<HomePageViewModel>(
            builder: (context, value, child) {
              return value.stateControle(
                const _GetStarted(),
                const _SpeedTestWidget(),
                const _GameOverWidget(),
              );
            },
          ),
        ],
      ),
    );
  }
}

AppBar get _buildAppbar => AppBar(
      foregroundColor: const Color(0xff7dfdd9),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text(
        "tincidunt",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
        ),
      ),
    );

class _GetStarted extends StatelessWidget {
  const _GetStarted();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyUserTextField(
          text: "Enter your name",
          controller: Provider.of<HomePageViewModel>(context, listen: false).controller,
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Welcome! Are you ready to test your typing speed? Click the 'Get started' button to begin and try to type as fast and accurately as you can. Good luck!",
            style: TextStyle(letterSpacing: 3, fontSize: 18, color: Color(0xff7dfdd9)),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: MyButton(
            onTap: () {
              Provider.of<HomePageViewModel>(context, listen: false).onStartClick();
            },
            text: "Get started",
          ),
        ),
      ],
    );
  }
}

class _SpeedTestWidget extends StatelessWidget {
  const _SpeedTestWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _ScoreTextWidget(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75.0),
          child: SizedBox(
            height: 100,
            child: MyMarqueeText(
              text: Provider.of<HomePageViewModel>(context, listen: false).lorem,
            ),
          ),
        ),
        MyTextField(
          text: "Start writing",
          onChanged: Provider.of<HomePageViewModel>(context, listen: false).onType,
        ),
      ],
    );
  }
}

class _GameOverWidget extends StatelessWidget {
  const _GameOverWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Score",
            style: TextStyle(
              fontSize: 24,
              letterSpacing: 4,
              color: Color(0xff7dfdd9),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const _ScoreTextWidget(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: MyButton(
              onTap: () {
                Provider.of<HomePageViewModel>(context, listen: false)
                    .addUser(Provider.of<HomePageViewModel>(context, listen: false).typedCharsLength);
                Provider.of<HomePageViewModel>(context, listen: false).step = 0;
                Provider.of<HomePageViewModel>(context, listen: false).typedCharsLength = 0;
              },
              text: "Try again",
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreTextWidget extends StatelessWidget {
  const _ScoreTextWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, viewModel, child) {
        return Text(
          viewModel.typedCharsLength.toString(),
          style: const TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.bold,
            color: Color(0xff7dfdd9),
          ),
        );
      },
    );
  }
}

class _MyDrawer extends StatelessWidget {
  const _MyDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade900,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 25),
              child: Text(
                "tincidunt",
                style: TextStyle(
                  color: Color(0xff7dfdd9),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: MyButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ScorePageView(),
                    ),
                  );
                },
                text: "High scores",
              ),
            ),
            const Spacer(),
            const Center(
              child: Text(
                "2024 @ibrahim.ytz",
                style: TextStyle(
                  color: Color(0xff7dfdd9),
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class ScorePage {}
