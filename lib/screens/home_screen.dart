import 'package:anotacoes_firebase/screens/add_screen.dart';
import 'package:anotacoes_firebase/screens/item_list.dart';
import 'package:anotacoes_firebase/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2c384a),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2c384a),
        title: const AppBarWidget(
          sectionName: 'Anotações',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: Colors.orangeAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: const ItemList()),
        ),
      ),
    );
  }
}
