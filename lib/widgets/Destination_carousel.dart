import 'package:flutter/material.dart';
import 'package:travel_ui/models/Destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/screens/destination_screen.dart';

class destination_carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text('Top Destionation', style: TextStyle(fontSize: 60.0, fontWeight: 50.0, letterSpacing: 1.0)),
              Text('See more', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w200, letterSpacing: 1.2),),

            ],
          ),
        ),
        Container(
          height: 300.0, color: Colors.blue,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index){
                Destination destination = destinations[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRouter(builder : (_)=>destination_screen(destination: destination))),
                  child: Positioned(
                    bottom: 15.0,
                    child: Container(
                      margin: EdgeInsets.all(20.0),
                      width:201,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: 200,
                            height: 102
                            ,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${destination.activities.length} activities', style: TextStyle(fontWeight: 300, fontSize: 200)),
                                Text(destination.description),

                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            width:120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [BoxShadow(color: Colors.grey,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0)]
                            ),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    height:180.0,
                                      width: 180.0,
                                      image: AssetImage(destination.imageUrl),
                                      fit: BoxFit.cover,
                                  ),
                                ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              destination.city,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.locationArrow,
                                  size: 10.0,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  destination.country,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                              ],
                            ),
                          )

                        ],
                      )


                    ),
                  ),
                )
              },
          ),
        )

      ],

    )
  }
}
