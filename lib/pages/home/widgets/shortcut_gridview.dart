import 'package:care/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shortcut {
  final String label;
  final String imagePath;
  final String route;

  Shortcut(this.label, this.imagePath, this.route);
}

class ShortcutGridView extends StatelessWidget {
  const ShortcutGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Shortcut> items = [
      Shortcut('Clinic', 'assets/png/clinic.png', '/clinic'),
      Shortcut('Doctor Chat', 'assets/png/doctorchat.png', '/doctor_chat'),
      Shortcut('Donation', 'assets/png/donation.png', '/donation'),
      Shortcut('Hospital', 'assets/png/hospital.png', '/hospital'),
      Shortcut('Insurance', 'assets/png/insurance.png', '/insurance'),
      Shortcut('Pharmacy', 'assets/png/pharmacy.png', '/pharmacy'),
      Shortcut('Appointment', 'assets/png/appointment.png', '/appointment'),
      Shortcut('Emergency', 'assets/png/emergency.png', '/emergency'),
      Shortcut('Medicine', 'assets/png/medicine.png', '/medicine'),
      Shortcut('See More', 'assets/png/grid.png', '/see_more'),
    ];
    items.sort((a, b) => a.label.compareTo(b.label));

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (context) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Get.toNamed(item.route);
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Image.asset(
                          item.imagePath,
                          width: 25.0,
                          height: 25.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.label,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
