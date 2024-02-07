import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';


class SectionOne extends StatelessWidget{
  const SectionOne({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text('Le chemin à la clé', style: TextStyle(fontFamily: 'Rockbell', fontSize: 50, fontStyle: FontStyle.italic)),
                // SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    "Please note that the actual names of settings may vary, and it's essential to refer to the documentation or the extension's official page for the most accurate and up-to-date information. \nIf the extension doesn't provide a specific setting for this behavior, you might consider reaching out to the extension's maintainers through the Visual Studio Code marketplace or GitHub repository to request such a feature or inquire about any updates related to this functionality.",
                    style: TextStyle(fontFamily: 'Rockbell', fontSize: 20)),
                )
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/mandala.jpg',
          fit: BoxFit.cover
        ),
        Image.asset(
          'assets/cle1.jpg',
          fit: BoxFit.cover
        )
      ],
    );
  }
}

class SectionTwo extends StatelessWidget{
  SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextStyle orangeStyle = theme.textTheme.displayMedium!.copyWith(  // le classe theme.textTheme permet d'accéder au thème des polices  // La propriété displayMedium est un grand style prévu pour le titrage du texte  // comprend des membres comme bodyMedium (pour le texte standard de taille moyenne), caption (pour les captures d'images) ou headlineLarge (pour les gros titres).  // ! est l'opérateur bang, permet d'indiquer à Dart qu'on sait ce qu'on fait
      color: theme.colorScheme.primary,  // copyWith() renvoie une copie du style de texte avec les modifications que vous avez apportées, ici juste la couleur du texte.  // La propriété onPrimary du jeu de couleurs définit une couleur adaptée pour apparaître au-dessus de la couleur principale de l'application.
      fontFamily: 'Rockbell',
    );

    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Ma proposition en terme de coaching",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rockbell',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const GlowText(
                      "BIENTOT DISPONIBLE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.orange,  // copyWith() renvoie une copie du style de texte avec les modifications que vous avez apportées, ici juste la couleur du texte.  // La propriété onPrimary du jeu de couleurs définit une couleur adaptée pour apparaître au-dessus de la couleur principale de l'application.
                          fontFamily: 'Rockbell',
                          //fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Obtenez la couleur idéale à faire à la maison grâce à un coloriste\nrien que pour vous",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Rockbell',
                        fontSize: 25
                        ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "En vous inscrivant à notre newsletter, vous beneficierez de\n40% de réduction sur votre première commande",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Rockbell',
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
  }
}

class SectionThree extends StatelessWidget{
  const SectionThree({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/om3.jpg',
          fit: BoxFit.cover
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text('Qui suis-je ?', style: TextStyle(fontFamily: 'Rockbell', fontSize: 50, fontStyle: FontStyle.italic)),
                // SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    "Please note that the actual names of settings may vary, and it's essential to refer to the documentation or the extension's official page for the most accurate and up-to-date information. \nIf the extension doesn't provide a specific setting for this behavior, you might consider reaching out to the extension's maintainers through the Visual Studio Code marketplace or GitHub repository to request such a feature or inquire about any updates related to this functionality.",
                    style: TextStyle(fontFamily: 'Rockbell', fontSize: 20)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}