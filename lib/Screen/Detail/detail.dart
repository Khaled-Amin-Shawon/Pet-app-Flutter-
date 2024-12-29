import 'package:flutter/material.dart';
import 'package:pet_app/Model/pets_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.pets});
  final PetsModel pets;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen size
    Size size = MediaQuery.of(context).size;
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
                          style: TextStyle(
                            fontSize: (screenWidth * 0.08).clamp(12, 32), // Adjust font size
                          ),
                        ),
                        Text(
                          pets.description,
                          style: TextStyle(
                            fontSize: (screenWidth * 0.04).clamp(12, 16), // Adjust font size
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
                                padding: const EdgeInsets.only(
                                    top: 10,
                                    left: 10,
                                    right: 10), // Adjust height
                                child: Image.asset(
                                  pets.image,
                                  height: size.height * 0.5, // Adjust height
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ageSexOrigin(
                                    pets.age, "Age", size, screenWidth),
                                ageSexOrigin(
                                    pets.sex, "Sex", size, screenWidth),
                                ageSexOrigin(
                                    pets.origin, "Origin", size, screenWidth),
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

  Container ageSexOrigin(
      String value, String name, Size size, double screenWidth) {
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (screenWidth * 0.04).clamp(12, 32), // Adjust font size
              color: Colors.black45,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: (screenWidth * 0.03).clamp(12, 16), // Adjust font size
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }
}
