import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Doctor {
  final String image;
  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;

  Doctor({
    required this.image,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
  });
}

class DoctorController extends GetxController {
  var doctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() async {
    final url = Uri.parse('http://localhost:3000/api/doctors');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> doctorData = jsonDecode(response.body);

        List<Doctor> fetchedDoctors = doctorData.map((data) {
          return Doctor(
            image: 'assets/images/doctor2.png',
            name: data['fullName'],
            specialty: data['subSpecialization'] ?? data['specialization'],
            rating: data['rating'].toDouble(),
            reviewCount: data['reviewCount'],
          );
        }).toList();

        doctors.assignAll(fetchedDoctors);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}

class TopDoctorListView extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());

  TopDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: doctorController.doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctorController.doctors[index];
            return Container(
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Card(
                color: Colors.white,
                elevation: 4, // Set elevation for shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Corner radius
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage(doctor.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white, // Ensure the container is white
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              doctor.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              doctor.specialty,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 20),
                                const SizedBox(width: 4),
                                Text(
                                  '${doctor.rating} (${doctor.reviewCount} reviews)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    });
  }
}
