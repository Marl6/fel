// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'formulas.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Personal Information'),
      ),
      body: Center(
        child: Text('Edit your personal information here'),
      ),
    );
  }
}

class ViewHealthData extends StatefulWidget {
  @override
  _ViewHealthDataState createState() => _ViewHealthDataState();
}

class _ViewHealthDataState extends State<ViewHealthData> {
  String? userName;
  String? userAddress;
  int? userAge;
  String? userGender;
  int? userHeightFeet;
  int? userHeightInches;
  double? userWeight;

  List<String> genderOptions = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Health Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userAddress = value;
                });
              },
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userAge = int.tryParse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: userGender,
              onChanged: (value) {
                setState(() {
                  userGender = value;
                });
              },
              hint: Text('Select Gender'),
              items: genderOptions
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        userHeightFeet = int.tryParse(value);
                      });
                    },
                    decoration: InputDecoration(labelText: 'Height (Feet)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        userHeightInches = int.tryParse(value);
                      });
                    },
                    decoration: InputDecoration(labelText: 'Height (Inches)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userWeight = double.tryParse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the user input here
                // You can use the variables userName, userAddress, userAge, userGender, userHeightFeet, userHeightInches, and userWeight as needed.
                // Call the function from formulas.dart to calculate desirable body weight
                double? dbw = calculateDesirableBodyWeight(
                    userHeightFeet, userHeightInches);

                // Call other functions from formulas.dart for additional computations

                // Show the results in a dialog or navigate to a new screen to display the results
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Results'),
                      content: Column(
                        children: [
                          Text(
                              'Desirable Body Weight: ${dbw?.toStringAsFixed(2)} kg'),
                          // Add more result fields here based on your computations
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  // Replace this with your actual calculation logic from formulas.dart
  double? calculateDesirableBodyWeight(int? feet, int? inches) {
    // Implement your desirable body weight calculation logic here
    // For example: return someValue;
    return 0.0;
  }
}
