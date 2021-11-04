import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/user_data.dart';
import 'package:untitled/views/dog_listview.dart';
import 'package:untitled/views/loading.dart';
import 'package:untitled/provider/dogs.dart';
import 'package:untitled/provider/ui.dart';
import 'package:untitled/views/login.dart';
import 'package:untitled/views/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UI()),
        ChangeNotifierProvider(create: (_) => DOGS()),
        ChangeNotifierProvider(create: (_) => DATA()),
      ],
      child: Consumer<UI>(builder: (context, ui, child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: ui.primaryColor
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoadingScreen(),
            '/home': (context) => HomePage(),
            '/login': (context) => const LoginScreen(),
            '/profile': (context) => const ProfileScreen(),
          },
        );
      })
    );
  }
}

class HomePage extends StatefulWidget {
  Widget actualPage = const LoginScreen();
  int currentIndex = 1;

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DOGS>(builder: (context, dogs, child) {
      return Scaffold(
        bottomNavigationBar: bottomNavBar(context),
        body: widget.actualPage,
      );
    });
  }

  Widget bottomNavBar(context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: "Dogs list",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email),
          label: "Connexion",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        )
      ],
      onTap: (routeName) {
        setState(() {
          widget.currentIndex = routeName;
        });
        onTapHandler(routeName);
      },
    );
  }

  void onTapHandler(int index) {
    switch (index) {
      case 0:
        setState(() {
          widget.actualPage = const ListScreen();
        });
        break;
      case 1:
        setState(() {
          widget.actualPage = const LoginScreen();
        });
        break;
        case 2:
        setState(() {
          widget.actualPage = const ProfileScreen();
        });
        break;
    }
  }
}