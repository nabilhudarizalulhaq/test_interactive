import 'package:flutter/material.dart';
import 'package:test_interactive/models/user_model.dart';
import 'package:test_interactive/page/home_page.dart';
import 'package:test_interactive/widgets/buttons.dart';

class WelcomeApps extends StatefulWidget {
  final UserModel user;
  const WelcomeApps({
    super.key,
    required this.user,
  });

  @override
  State<WelcomeApps> createState() => _WelcomeAppsState();
}

class _WelcomeAppsState extends State<WelcomeApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to MyAplication',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Account no : ${widget.user.noAkun}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Nama : ${widget.user.nama}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(title: 'test'),
                      ),
                    );
                  },
                  title: 'back',
                  width: 80,
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
