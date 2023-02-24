import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Purwokerto");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.blue[800],
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   centerTitle: false,
        //   titleSpacing: 0,
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   title: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     width: size.width,
        //   ),
        // ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  currentWeather(
                      Icons.wb_sunny, data!.temp.toString(), data!.cityName!),
                  const SizedBox(
                    height: 20.0,
                  ),
                  additionalInformation(
                      data!.wind.toString(),
                      data!.humidity.toString(),
                      data!.feelsLike.toString(),
                      data!.pressure.toString()),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
