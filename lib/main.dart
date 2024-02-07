import 'package:flutter/material.dart';
import 'package:le_chemin_a_la_cle/contact_page.dart';
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
  
  var selectedIndex = 0;
  
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
            color: Colors.grey[100], 
            width: double.infinity,
            child: SectionOne(),
          ),
          Container(
            color: Color.fromARGB(255, 255, 255, 255),
            width: double.infinity,
            child: SectionTwo(),
          ),
          Container(
            height: 400,
            color: Colors.grey[100], 
            width: double.infinity,
            child: SectionThree(),
          ),
          Container(
            height: 800,
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
