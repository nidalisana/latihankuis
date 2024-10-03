import 'package:flutter/material.dart';
import 'vehicle-data.dart'; 
import 'package:latihankuis/login_page.dart';

class VehiclePage extends StatelessWidget {
  final String username;

  VehiclePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Kendaraan", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false, 
        backgroundColor: const Color.fromARGB(255, 26, 92, 126), 
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 54, 139, 182),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selamat datang!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 10),
                Text("Hallo $username", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white70)),
              ],
            ),
          ),
         
          Expanded(
            child: ListView.builder(
              itemCount: vehicleList.length, 
              itemBuilder: (context, index) {
                final vehicle = vehicleList[index]; 
                return Card(
                  elevation: 4, 
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: Image.network(vehicle.imageUrls[0], width: 100), 
                    title: Text(vehicle.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(vehicle.type, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        SizedBox(height: 4),
                        Text(vehicle.description, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        SizedBox(height: 4),
                        Text('Mesin: ${vehicle.engine}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        Text('Bahan Bakar: ${vehicle.fuelType}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                        Text(vehicle.price, style: TextStyle(fontSize: 16, color: Colors.blueGrey[800])),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Tombol Logout
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), 
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), 
                ),
              ),
              child: Text('Log Out', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
