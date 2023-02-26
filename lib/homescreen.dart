import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:finalprject/my_drawer_header.dart';
import 'bmiCalculator.dart';
import 'weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.bmi;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.bmi) {
      container = BMICalc();
    } else if (currentPage == DrawerSections.weather) {
      container = WeatherPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: Text("Home Screen"),
      ),
      body: container,
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            MyHeaderDrawer(),
            MyDrawerList(),
          ]),
        ),
      )),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "BMI", Icons.dashboard_outlined,
              currentPage == DrawerSections.bmi ? true : false),
          menuItem(2, "Weather", Icons.people_alt_outlined,
              currentPage == DrawerSections.weather ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.bmi;
            } else if (id == 2) {
              currentPage = DrawerSections.weather;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  bmi,
  weather,
}
