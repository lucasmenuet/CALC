import 'package:flutter/material.dart';
import 'package:le_chemin_a_la_cle/app_defaults.dart';



// ------ ME CONTACTER ------ //
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  String? selectedValueType;

  final _formKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFFFFF), // White
                Color(0xFFFFF7E5), // Light orange
                Color(0xFFFFDAB9), // Peach
              ],
              stops: [
                0.0,
                0.4,
                1.0
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange), // Set the border color
                        borderRadius: BorderRadius.circular(8.0), // Set the border radius
                        color: const Color.fromARGB(0, 146, 35, 35), // Set the background color to transparent
                      ),
                      child: Column(
                        children: [
                          Text("Vous souhaitez vous faire accompagner"),
                          Text("pour atteindre votre objectif personnel ou professionnel ?"),
                          Text("Contactez-moi via le formulaire ci-contre"),
                          Text("et je reviendrai vers vous rapidement pour échanger sur votre besoin.")
                        ],
                      ),
                    ),
                    SizedBox(height: 70,),
                    Text(
                      "INFOS DE CONTACT",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 32,
                        fontFamily: 'Rockbell'
                      )
                    ),
                    SizedBox(height: 20,),
                    Text("Olivier Menuet"),
                    Text("Le chemin à (a) la clé"),
                    Text("calc@gmail.com"),
                    Text("10 Rue Tourbillon, 35000 Tours"),
                    Text("+33 6 40 50 06 35")
                  ],
                ),
              ),
              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 100,
                endIndent: 100,
                color: Colors.grey,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    children: [
                      const Text(
                        "CONTACT",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 32,
                          fontFamily: 'Rockbell'
                        )
                      ),
                      SizedBox(height: 50,),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoginForm(
                              emailController: emailController,
                              prenomController: firstnameController,
                              nomController: lastnameController,
                              telController: phoneController,
                              sujetController: subjectController,
                              messageController: bodyController,
                            ),
                            if (_isProcessing)
                              const Center(child: CircularProgressIndicator())
                            else
                              Contact(
                                onSignIn: () async {
                                  if (_formKey.currentState!.validate()) {
                                    print(firstnameController.text);
                                    emailController.clear();
                                    firstnameController.clear();
                                    lastnameController.clear();
                                    phoneController.clear();
                                    subjectController.clear();
                                    bodyController.clear();
                                  }
                                }
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),                    
            ]
          ),
        )
      )
    );
  }
}



class Contact extends StatelessWidget {
  const Contact({
    Key? key,
    required this.onSignIn,
  }) : super(key: key);

  final void Function() onSignIn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: AppDefaults.margin * 3),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFDAB9)),
              onPressed: onSignIn,
              child: const Text(
                "Envoyer",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



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
            decoration: FieldDecoration.classicField(field: 'Message'),
            maxLines: 4,
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
