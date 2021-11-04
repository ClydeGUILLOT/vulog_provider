import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/ui.dart';
import 'package:untitled/provider/user_data.dart';
import 'package:untitled/ui/drop_down.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TEST Provider')),

        body: Consumer<DATA>(builder: (context, data, child) {
          return Column(
            children: [
              (data.getToken != "") ? userScreen() : const SizedBox(),
              settingScreen(),
            ],
          );
        })
    );
  }
}

Widget settingScreen() {
  return Consumer<UI>(builder: (context, ui, child) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text('SETTINGS'),
          const SizedBox(height: 10),
          dropDown(ui),
        ],
      ),
    );
  });
}

Widget userScreen() {
  return Consumer<DATA>(builder: (context, data, child) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('PROFILE'),
          const SizedBox(height: 10),
          Text("Hello ${data.userFistName} ${data.userLastName}"),
          const SizedBox(height: 10),
          CircleAvatar(radius: 50.0, backgroundImage: data.userAvatar,),
          const SizedBox(height: 20),
        ],
      ),
    );
  });
}