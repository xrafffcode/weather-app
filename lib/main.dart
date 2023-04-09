import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  TextEditingController _cityController = TextEditingController();

  Future<void> getData(String city) async {
    data = await client.getCurrentWeather(city);
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(110, 133, 183, 100),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter city',
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    getData(_cityController.text);
                  });
                },
                child: const Text('Infokan Cuaca'),
              )
            ],
          ),
        ),
      ),
      body: data == null
          ? const Center(
              child: Text('Enter city to get weather'),
            )
          : FutureBuilder(
              future: getData(_cityController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      currentWeather(
                          data!.icon.toString(),
                          data!.description.toString().toUpperCase(),
                          data!.temp.toString(),
                          data!.cityName!),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      additionalInformation(
                        data!.wind.toString(),
                        data!.humidity.toString(),
                        data!.pressure.toString(),
                        data!.feelsLike.toString(),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }
}
