import 'package:anotacoes_firebase/screens/edit_item_form.dart';
import 'package:anotacoes_firebase/validators/database.dart';
import 'package:anotacoes_firebase/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class EditScreem extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  const EditScreem({
    Key? key,
    required this.currentTitle,
    required this.currentDescription,
    required this.documentId,
  }) : super(key: key);

  @override
  _EditScreemState createState() => _EditScreemState();
}

class _EditScreemState extends State<EditScreem> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

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
            sectionName: 'Anotações',
          ),
          actions: [
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 16),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });
                      await Database.deleteItem(docId: widget.documentId);
                      setState(() {
                        _isDeleting = false;
                      });
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                  )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: EditItemForm(
                  documentId: widget.documentId,
                  titleFocusNode: _titleFocusNode,
                  descriptionFocusNode: _descriptionFocusNode,
                  currentTitle: widget.currentTitle,
                  currentDescription: widget.currentDescription,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
