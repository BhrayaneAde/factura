import 'package:flutter/material.dart';

import 'loginPage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? userType;
  String? transportMode;

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
                'Créer votre compte',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Partie principale de la page
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Champs pour le nom et le prénom
                    const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text(
                                'Nom',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004aad),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              label: Text(
                                'Prénom',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff004aad),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Champ "Téléphone" avec indicatif et préfixe non modifiables
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 14.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
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

                        const Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixText: '01 ', // Préfixe non modifiable
                              prefixStyle: TextStyle(
                                color: Colors.grey,
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
                                Icons.check,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Dropdown pour le type d'utilisateur
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Type d\'utilisateur',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff004aad),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'client',
                          child: Text('Client'),
                        ),
                        DropdownMenuItem(
                          value: 'transporteur',
                          child: Text('Transporteur'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          userType = value;
                          if (value != 'transporteur') {
                            transportMode = null;
                          }
                        });
                      },
                      value: userType,
                    ),

                    // Dropdown pour le mode de transport si transporteur
                    if (userType == 'transporteur') ...[
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Moyen de transport',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff004aad),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'moto',
                            child: Row(
                              children: [
                                Icon(Icons.motorcycle, color: Colors.black),
                                SizedBox(width: 10),
                                Text('Moto'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'tricycle',
                            child: Row(
                              children: [
                                Icon(Icons.electric_rickshaw, color: Colors.black),
                                SizedBox(width: 10),
                                Text('Tricycle'),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'voiture',
                            child: Row(
                              children: [
                                Icon(Icons.directions_car, color: Colors.black),
                                SizedBox(width: 10),
                                Text('Voiture'),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            transportMode = value;
                          });
                        },
                        value: transportMode,
                      ),
                    ],

                    const SizedBox(height: 70),

                    // Bouton "S'inscrire"
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
                          "S'inscrire",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),

                    // Lien vers la connexion
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Vous avez un compte ?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              "Se connecter",
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
        ],
      ),
    );
  }
}
