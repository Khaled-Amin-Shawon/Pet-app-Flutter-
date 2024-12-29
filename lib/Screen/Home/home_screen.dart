import 'package:flutter/material.dart';
import 'package:pet_app/Model/pets_model.dart';
import 'package:pet_app/Screen/Detail/detail.dart';
import 'package:pet_app/Screen/Profile/profile_screen.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int selecteditem = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<List<PetsModel>> categories = [cats, dogs, birds, snakes, other];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selecteditem,
        onTap: (index) {
          setState(() {
            selecteditem = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            tooltip: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            tooltip: "Profile",
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/profile.png"),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Hi, Khaled",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: Text.rich(
                    TextSpan(
                        text: "Adopt\n",
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "your pet's here!",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                categorySelection(),
                selectedIndex < categoryList.length
                    ? (Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: SizedBox(
                          height: size.height * 0.63,
                          child: ListView.builder(
                              itemCount: categories[selectedIndex].length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          pets: categories[selectedIndex][index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 30, right: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                height: size.height * 0.25,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 30),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: categories[selectedIndex]
                                                            [index]
                                                        .color,
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                  ),
                                                  height: size.height * 0.25,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.25,
                                                child: Center(
                                                  child: Hero(
                                                    tag: categories[selectedIndex]
                                                            [index]
                                                        .image,
                                                    child: Image.asset(
                                                      categories[selectedIndex]
                                                              [index]
                                                          .image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 25),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: categories[selectedIndex]
                                                        [index]
                                                    .color
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),
                                                ),
                                              ),
                                              height: size.height * 0.18,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 15),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      categories[selectedIndex]
                                                              [index]
                                                          .name,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      categories[selectedIndex]
                                                              [index]
                                                          .breed,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          categories[selectedIndex]
                                                                  [index]
                                                              .sex,
                                                          style: const TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          ", ${categories[selectedIndex][index].age} year old",
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ))
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 75,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blue
                          : Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: selectedIndex == index
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        categoryList[index],
                        style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
