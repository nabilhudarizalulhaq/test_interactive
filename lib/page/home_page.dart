import 'package:flutter/material.dart';
import 'package:test_interactive/controller/controller.dart';
import 'package:test_interactive/models/user_model.dart';
import 'package:test_interactive/page/welcome.dart';
import 'package:test_interactive/service/service.dart';
import 'package:test_interactive/widgets/buttons.dart';
import 'package:test_interactive/widgets/form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AddItem _itemService = AddController();
  final _noAkunController = TextEditingController();
  final _namaController = TextEditingController();

  void clearText() {
    _namaController.clear();
    _noAkunController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //form input
                CustomFormField(
                  controller: _namaController,
                  title: 'Namanya',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  controller: _noAkunController,
                  title: 'No Akun',
                ),
                const SizedBox(
                  height: 80,
                ),
                //Button action
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      onPressed: () async {
                        UserModel users = await _itemService.addData(
                            _namaController.text, _noAkunController.text);
                            Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => WelcomeApps(
                              user: users,
                            ),
                          ),
                        );
                      },
                      title: 'Submit',
                      width: 100,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                      onPressed: () => clearText(),
                      title: 'Delete',
                      width: 100,
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
