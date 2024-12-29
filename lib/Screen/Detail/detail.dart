import 'package:flutter/material.dart';
import 'package:pet_app/Model/pets_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.pets});
  final PetsModel pets;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // Get screen size
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: size.height, // Use screen height
                  width: size.width, // Use screen width
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.73), // Adjust height
                        Text(
                          pets.name,
                          style: const TextStyle(
                            fontSize: 32, // Adjust font size
                          ),
                        ),
                        Text(
                          pets.description,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 16, // Adjust font size
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: size.height * 0.7, // Adjust height
                    width: size.width, // Adjust width
                    decoration: BoxDecoration(
                      color: pets.color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Center(
                            child: Hero(
                              tag: pets.image,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10), // Adjust height
                                child: Image.asset(
                                  pets.image,
                                  height: size.height * 0.5, // Adjust height
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ageSexOrigin(pets.age, "Age", size),
                                ageSexOrigin(pets.sex, "Sex", size),
                                ageSexOrigin(pets.origin, "Origin", size),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container ageSexOrigin(String value, String name, Size size) {
    return Container(
      height: size.height * 0.1, // Adjust height
      width: size.width * 0.25, // Adjust width
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20, // Adjust font size
              color: Colors.black45,
            ),
          ),
          Text(
            name,
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 16, // Adjust font size
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }
}

