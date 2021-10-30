import 'package:anotacoes_firebase/screens/home_screen.dart';
import 'package:anotacoes_firebase/validators/database.dart';
import 'package:anotacoes_firebase/validators/validators.dart';
import 'package:anotacoes_firebase/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;
  const LoginForm({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _uidController = TextEditingController();

  final _loginInFormkey = GlobalKey<FormState>();

  String getId = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        height: MediaQuery.of(context).size.height * .3,
        child: SingleChildScrollView(
          child: Form(
            key: _loginInFormkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                  child: Column(
                    children: [
                      CustomFormField(
                        isObscure: true,
                        initialValue: '',
                        controller: _uidController,
                        focusNode: widget.focusNode,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        label: 'ID unico',
                        hint: 'Digite seu ID',
                        validator: (value) {
                          Validator.validadeUserId(
                            uid: value,
                          );
                          getId = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.focusNode.unfocus();

                        if (_loginInFormkey.currentState!.validate()) {
                          Database.userId = getId;
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (contex) => const HomeScreen()));
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orangeAccent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
