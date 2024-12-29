import 'package:flutter/material.dart';
import 'package:pet_app/Screen/Home/home_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  final int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PetsHomeScreen()),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                    'images/profile.png'), // Replace with your image asset
              ),
              const SizedBox(height: 16),
              const Text(
                'KHALED AMIN SHAWON',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      color: Colors.white,
                      blurRadius: 2,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'mdkhaledaminshawon@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text('+880 1797-939155'),
              ),
              const ListTile(
                leading: Icon(Icons.cake),
                title: Text('Date of Birth'),
                subtitle: Text('13/10/2002'),
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address'),
                subtitle: Text('Bhaktipur,Mithapukur, Rangpur, Bangladesh'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                  // Add your logic here
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
