import 'package:flutter/material.dart';

Widget currentWeather(
    String icon, String description, String temp, String location) {
  // return Center(
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(
  //         icon,
  //         size: 65.0,
  //         color: Colors.orange,
  //       ),
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       Text(
  //         temp,
  //         style: const TextStyle(
  //             fontSize: 50.0, fontWeight: FontWeight.w500, color: Colors.white),
  //       ),
  //       const SizedBox(
  //         height: 10.0,
  //       ),
  //       Text(
  //         location,
  //         style: const TextStyle(
  //             fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
  //       ),
  //     ],
  //   ),
  // );
  return Column(
    children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              location,
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
      Image.network(
        "http://openweathermap.org/img/wn/$icon@2x.png",
        width: 180.0,
        height: 180.0,
        fit: BoxFit.fill,
      ),
      Text(
        description,
        style: const TextStyle(fontSize: 23.00, color: Colors.white),
      ),
      const SizedBox(
        height: 10.00,
      ),
      Text(
        "$temp°C",
        textAlign: TextAlign.start,
        style: const TextStyle(
            fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
      )
    ],
  );
}
