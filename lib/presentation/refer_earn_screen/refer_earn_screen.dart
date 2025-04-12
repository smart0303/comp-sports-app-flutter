// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/app_export.dart';
import 'controller/refer_earn_controller.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  ReferEarnController controller = Get.put(ReferEarnController());

  String selectedCountry = 'lbl_usa'.tr;

  void selectCountry(String country) {
    setState(() {
      selectedCountry = country;
    });
  }

  @override
  void initState() {
    setSafeAreaColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Refer & Earn'),
        centerTitle: true, // Center the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Refer to your friends &\nearn 200 reward',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                        'adam20220320                                     Copy'),
                  ),
                ),
                SizedBox(width: 8),
                // TextButton(
                //   onPressed: () {
                //     // Handle copy action
                //   },
                //   child: Text('Copy'),
                // ),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    // Handle invite action
                  },
                  child: Text('SHARE'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white, // Set text color to white
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Set your desired radius
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Invite a friend',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search your friend',
                prefixIcon: Icon(Icons.search,
                    color: Colors.grey), // Set prefix icon color
                suffixIcon: Icon(Icons.mic,
                    color: Colors.grey), // Set suffix icon color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildContactTile('Miracle Vetrovs'),
                  buildContactTile('Charlie Donin'),
                  buildContactTile('Kaylynn Korsgaard'),
                  buildContactTile('Alena Culhane'),
                  buildContactTile('Marcus Culhane'),
                  buildContactTile('Nolan Geidt'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContactTile(String name) {
    return Column(
      children: [
        ListTile(
          leading: CustomImageView(
            imagePath: ImageConstant.imgAvtar1,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(name),
          subtitle: Text('Contact'),
          trailing: TextButton(
            onPressed: () {
              // Handle invite action
            },
            child: Text('Invite'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.red[50],
            ),
          ),
        ),
        Divider(
          color: Colors.grey[80],
          thickness: 1,
        ),
      ],
    );
  }
}
