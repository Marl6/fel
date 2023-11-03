import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'formulas.dart';
import 'profile1.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MainView(),
    ),
  );
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  /// User details
  String? userName;
  String? userAddress;
  int? userAge;
  String? userGender;
  int? userHeightFeet;
  int? userHeightInches;
  double? userWeight;

  List<String> genderOptions = ['Male', 'Female'];

  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Patients',
              ),
              SideNavigationBarItem(
                icon: Icons.health_and_safety,
                label: 'Nutrition Calculator',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: selectedIndex == 1
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          onChanged: (value) {
                            userName = value;
                          },
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          onChanged: (value) {
                            userAddress = value;
                          },
                          decoration: InputDecoration(labelText: 'Address'),
                        ),
                        TextField(
                          onChanged: (value) {
                            userAge = int.tryParse(value);
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
                                  userHeightFeet = int.tryParse(value);
                                },
                                decoration:
                                    InputDecoration(labelText: 'Height (Feet)'),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  userHeightInches = int.tryParse(value);
                                },
                                decoration: InputDecoration(
                                    labelText: 'Height (Inches)'),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          onChanged: (value) {
                            userWeight = double.tryParse(value);
                          },
                          decoration: InputDecoration(labelText: 'Weight (kg)'),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
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
                                          'Desirable Body Weight: ${dbw.toStringAsFixed(2)} kg'),
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
                  )
                : selectedIndex == 0
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const ProfilePage1(),
                      )
                    : Center(
                        child: Text(
                          selectedIndex == 1
                              ? 'Nutrition Calculator'
                              : 'Settings',
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
