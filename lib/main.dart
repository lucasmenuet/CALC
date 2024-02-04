import 'package:flutter/material.dart';
import 'package:le_chemin_a_la_cle/contact_page.dart';
import 'package:le_chemin_a_la_cle/app_defaults.dart';
import 'package:le_chemin_a_la_cle/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le chemin à la clé',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}










// ---- HOME PAGE ----- //
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {  // Cette classe étend State et peut donc gérer ses propres valeurs. (Elle peut changer d'elle-même.)  // Le trait de soulignement (_) au début de _MyHomePageState rend la classe privée, laquelle est appliquée par le compilateur
  // Chaque widget définit une méthode build() automatiquement appelée dès que les conditions du widget changent, de sorte qu'il soit toujours à jour
  
  var selectedIndex = 2;
  
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LandingPage();
        break;
      case 1:
        page = FavoritesScreen();
        break;
      case 2:
        page = LoginPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    final buttonsBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // Adjust the border radius as needed
      // side: BorderSide(color: Colors.red),
    );

    final appbarStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              {return Color(0xFFFFF7E5);} 
            return null;
        }),
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15, color: Colors.black)),
      shape: MaterialStateProperty.all(buttonsBorder),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(0) 
    );
    
    final contactButtonStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15, color: Colors.black)),
      shape: MaterialStateProperty.all(buttonsBorder),
      backgroundColor: MaterialStateProperty.all(Color(0xFFFFDAB9)),
    );

    return LayoutBuilder(
      builder: (context, constraints) { 
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            foregroundColor: Theme.of(context).primaryColor,
            title: Container(
              alignment: Alignment.center,
              child: const Text('CALC', style: TextStyle(fontFamily: 'Rockbell', fontSize: 30, fontWeight: FontWeight.bold))
            ),
            actions: <Widget>[
              SizedBox(width: 700,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style : appbarStyle,
                  onPressed: () {
                    setState(() {  // Cet appel à setState() est semblable à la méthode notifyListeners() précédemment utilisée et garantit la mise à jour de l'UI.
                      selectedIndex = 0;
                    });
                  },
                  child: const Text('Accueil'),
                ),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: appbarStyle,
                  onPressed: () {
                    setState(() {  // Cet appel à setState() est semblable à la méthode notifyListeners() précédemment utilisée et garantit la mise à jour de l'UI.
                      selectedIndex = 1;
                    });
                  },
                  child: const Text('Articles'),
                ),
              ),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: contactButtonStyle,
                  onPressed: () {
                    setState(() {  // Cet appel à setState() est semblable à la méthode notifyListeners() précédemment utilisée et garantit la mise à jour de l'UI.
                      selectedIndex = 2;
                    });
                  },
                  child: const Text('Me contacter'),
                ),
              ),
              SizedBox(width: 200,),
            ],
          ),
          body: Column(
            children: [
              Expanded(  // Expanded très utiles pour les Row et les Column lorsque certains enfant n'utilisent que l'espace dont ils ont besoin (ici NavigationRail)
                child: Container(
                  color: const Color.fromARGB(255, 222, 215, 223),  // Container coloré
                  child: page,  // Generation Page or Favorites Page
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}




// ---- ACCUEIL ----- //
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  // variables
  final double logoHeight = 40;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF), // White
                  Color(0xFFFFF7E5), // Light orange
                  Color(0xFFFFDAB9), // Peach
                ],
                stops: [
                  0.0,
                  0.2,
                  1.0
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
              )
            ),
            width: double.infinity,
            child: SectionOne(),
          ),
          Container(
            color: Color.fromARGB(255, 248, 242, 230),
            width: double.infinity,
            child: SectionTwo(),
          ),
          Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF), // White
                  Color(0xFFFFF7E5), // Light orange
                  Color(0xFFFFDAB9), // Peach
                  Color(0xFFFFA500), // Orange
                ],
                stops: [
                  0.0,
                  0.2,
                  0.8,
                  1.0
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
              )
            ),
          ),
          Container(
            height: 800,
            color: Color.fromARGB(232, 207, 15, 159),
          ),
        ],
      ),
    );
  }
}


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

    final mediaWidth = MediaQuery.sizeOf(context).width;
    final mediaHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF), // White
                  Color(0xFFFFF7E5), // Light orange
                  Color(0xFFFFDAB9), // Peach
                  Color(0xFFFFA500), // Orange
                ],
                stops: [
                  0.0,
                  0.4,
                  0.8,
                  1.0
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
              )
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text("CONTACT",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 32,
                        fontFamily: 'Rockbell'
                    )
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange), // Set the border color
                            borderRadius: BorderRadius.circular(8.0), // Set the border radius
                            color: Colors.transparent, // Set the background color to transparent
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
                    SizedBox(width: 70,),
                    Container(
                      constraints: BoxConstraints(maxWidth: 700.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoginForm(
                              emailController: emailController,
                              prenomController: firstnameController,
                              nomController: lastnameController,
                              telController: phoneController,
                              sujetController: subjectController,
                              messageController: bodyController,),
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
              ],
            ),
          ),
        ),
      ),
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





















class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}
