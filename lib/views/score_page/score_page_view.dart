import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tincidunt/models/user_model.dart';
import 'package:tincidunt/views/score_page/score_page_view_model.dart';

class ScorePageView extends StatelessWidget {
  const ScorePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xff7dfdd9),
        title: const Text(
          "High scores in the world",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 3,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<List<UserModel>>(
          stream: Provider.of<ScorePageViewModel>(context, listen: false).getUserList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Wrong"),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<UserModel> userList = snapshot.data!;

            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                UserModel user = userList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 57, 57, 57), borderRadius: BorderRadius.circular(13)),
                  child: ListTile(
                    trailing: Text(
                      user.score.toString(),
                      style: const TextStyle(
                        color: Color(0xff7dfdd9),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        color: Color(0xff7dfdd9),
                        fontSize: 18,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
