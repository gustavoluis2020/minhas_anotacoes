import 'package:anotacoes_firebase/validators/database.dart';
import 'package:anotacoes_firebase/validators/validators.dart';
import 'package:anotacoes_firebase/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  const AddItemForm({
    Key? key,
    required this.titleFocusNode,
    required this.descriptionFocusNode,
  }) : super(key: key);

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  String getTitle = '';
  String getDescription = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Titulo',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomFormField(
                    initialValue: '',
                    isLabelEnabled: false,
                    controller: _titleController,
                    focusNode: widget.titleFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validator.validadeField(
                        value: value,
                      );
                      getTitle = value;
                    },
                    label: 'Digite o Titulo',
                    hint: 'Titulo da sua Anotação',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Anotação',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomFormField(
                    initialValue: '',
                    maxLines: 10,
                    isLabelEnabled: false,
                    controller: _descriptionController,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    validator: (value) {
                      Validator.validadeField(
                        value: value,
                      );
                      getDescription = value;
                    },
                    label: 'Digite sua Anotação',
                    hint: 'Digite sua Anotação',
                  ),
                ],
              ),
            ),
            _isProcessing
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  )
                : SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        widget.titleFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();
                        if (_addItemFormKey.currentState!.validate()) {
                          setState(() {
                            _isProcessing = true;
                          });
                          await Database.addItem(
                              title: getTitle, // recebe da pag database
                              description: getDescription);

                          setState(() {
                            _isProcessing = false;
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.orangeAccent,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
