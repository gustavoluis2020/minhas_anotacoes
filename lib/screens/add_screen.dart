import 'package:anotacoes_firebase/screens/add_item_form.dart';
import 'package:anotacoes_firebase/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2c384a),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff2c384a),
          title: const AppBarWidget(
            sectionName: ' Anotações',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: AddItemForm(
              descriptionFocusNode: _descriptionFocusNode,
              titleFocusNode: _titleFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
