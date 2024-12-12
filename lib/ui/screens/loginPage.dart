import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fond avec un dégradé de couleur
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff004aad),
                  Color(0xff000000),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Bienvenue\nConnexion!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Partie principale de la page
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.grey[200],
                ),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      // Section d'introduction
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xff004aad),
                              Color(0xff000000),
                            ],
                          ).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                          child: const Text(
                            "VERIFICATION OTP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // La couleur doit être définie ici pour que le ShaderMask fonctionne
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Champ "Téléphone" avec indicatif et préfixe
                      Row(
                        children: [
                          // Indicateur de pays fixe
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 14.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              '+229',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Champ de texte pour le numéro
                          Expanded(
                            child: TextField(
                              keyboardType:
                                  TextInputType.number, // Clavier pour chiffres
                              inputFormatters: [
                                FilteringTextInputFormatter
                                    .digitsOnly, // Limite l'entrée aux chiffres
                              ],
                              style: const TextStyle(
                                color: Colors.black, // Couleur du texte saisi
                                fontWeight:
                                    FontWeight.bold, // Texte saisi en gras
                              ),
                              decoration: const InputDecoration(
                                filled:
                                    true, // Active le remplissage de l'arrière-plan
                                fillColor: Colors
                                    .white, // Couleur de fond blanche pour l'input
                                prefixText: '01 ', // Préfixe non modifiable
                                prefixStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'Téléphone',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004aad),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 70),

                      // Bouton "Se connecter"
                      Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff004aad),
                              Color(0xff000000),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Se connecter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Section explicative
                      const Text(
                        "Bénéficiez d'un accès sécurisé et rapide à vos fonctionnalités préférées.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 70),

                      // Lien vers l'inscription
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Vous n'avez pas de compte ?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Register(),
                                  ),
                                );
                              },
                              child: const Text(
                                "S'inscrire",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        color: const Color(0xFF222222),
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.facebook,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.twitter,
                      color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.instagram,
                      color: Colors.white),
                ),
              ],
            ),
            const Expanded(
              child: Text(
                'Suivez-nous sur les réseaux sociaux',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
