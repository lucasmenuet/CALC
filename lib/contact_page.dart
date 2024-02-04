import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.emailController,
    required this.prenomController,
    required this.nomController,
    required this.telController,
    required this.sujetController,
    required this.messageController,
  }) : super(key: key);
  final TextEditingController emailController;
  final TextEditingController prenomController;
  final TextEditingController nomController;
  final TextEditingController telController;
  final TextEditingController sujetController;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 16),
          TextFormField( // PRENOM
            controller: prenomController,
            decoration: FieldDecoration.classicField(field: 'Prénom')
          ),
          SizedBox(height: 16,),
          TextFormField( // NOM
            controller: nomController,
            decoration: FieldDecoration.classicField(field: 'Nom')
          ),
          const SizedBox(height: 16),
          TextFormField( // E-MAIL
            controller: emailController,
            validator: (value) =>
                Validator.validateEmail(email: value as String),
            decoration: FieldDecoration.classicField(field: 'E-mail')
          ),
          const SizedBox(height: 16),
          TextFormField( // NOM
            controller: telController,
            decoration: FieldDecoration.classicField(field: 'Téléphone')
          ),
          const SizedBox(height: 16),
          TextFormField( // NOM
            controller: sujetController,
            decoration: FieldDecoration.classicField(field: 'Sujet')
          ),
          const SizedBox(height: 16),
          TextFormField( // NOM
            controller: messageController,
            decoration: FieldDecoration.classicField(field: 'Message')
          )
        ],
      ),
    );
  }
}



class Validator {
  static String? validateEmail({String? email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegexp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (email.isEmpty) {
      return "Renseigner l'email";
    } else if (!emailRegexp.hasMatch(email)) {
      return "L'email est invalide";
    }
    return null;
  }

}


class FieldDecoration {
  static InputDecoration? classicField(
      {required String? field}) {
    
    return InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.5),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.5),
              ),
              labelText: field,
              hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
