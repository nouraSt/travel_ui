import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/widgets/Destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int selectedIndex=0;
  int _currentTab=0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        selectedIndex=index;
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: selectedIndex==index? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: selectedIndex==index? Theme.of(context).primaryColor : Colors.grey,
        )
      ),
    )
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, ),
              child: Text('What would you like to find', style:TextStyle(fontSize:30.0, fontWeight: FontWeight.bold,  )),
            ),
            SizedBox(height:20.0, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key)).toList(),
            ),
            SizedBox(height: 20, width: 20),
            destination_carousel(),
            SizedBox(height: 20, width: 20),
            HotelCarousel(),


          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: _currentTab,
        currentIndex: _currentTab,
      onTap: (int value){
        setState(() {
          _currentTab= value;
        });
      },

      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 30.0,
          ),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_pizza,
            size: 30.0,
          ),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 15.0,
            backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
          ),
          title: SizedBox.shrink(),
        )
        ],),

    );
  }
}
