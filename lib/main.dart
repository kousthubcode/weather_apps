import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic place_text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Weather App"),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: Container(
          height: 700,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.wallpapersafari.com/5/95/Tk6mUs.jpg"),
                fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text('\n'),
              ),
              FutureBuilder(
                  future: apicall(place_text.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 264,
                                  height: 60,
                                  child: TextField(
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    onChanged: (text) => {},
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    controller: place_text,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.blueAccent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.blueAccent),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.white70,
                                      ),
                                      hintText: 'Enter a city name',
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
                                      filled: true,
                                      fillColor: Colors.blue[900],
                                    ),
                                  ),
                                ),
                                Text('    '),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      future:
                                      apicall(place_text.text);
                                    });
                                  },
                                  child: const Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[900],
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2,
                                            style: BorderStyle.solid),
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                    padding: EdgeInsets.all(20.0),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(''),
                                  Text(''),
                                  Text(
                                    snapshot.data['name'].toString(),
                                    style: const TextStyle(
                                        fontSize: 54,
                                        fontFamily: 'Courier',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data['temp'].toStringAsFixed(0) +
                                        '°C',
                                    style: const TextStyle(
                                        fontSize: 50,
                                        fontFamily: 'Courier',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Feels like: ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data['feels_like']
                                                .toStringAsFixed(0) +
                                            '°C',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text('  '),
                                  Column(children: [
                                    if (snapshot.data['main'].toString() ==
                                        'Sunny') ...[
                                      const Icon(Icons.sunny,
                                          color: Colors.yellow, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Clouds') ...[
                                      const Icon(Icons.cloud,
                                          color: Colors.grey, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Rain') ...[
                                      const Icon(Icons.water_drop,
                                          color: Colors.lightBlue, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Mist') ...[
                                      const Icon(Icons.foggy,
                                          color: Colors.white, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Drizzle') ...[
                                      const Icon(Icons.water_drop,
                                          color: Colors.lightBlue, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Clear') ...[
                                      const Icon(Icons.sunny,
                                          color: Colors.yellow, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Fog') ...[
                                      const Icon(Icons.foggy,
                                          color: Colors.white, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Haze') ...[
                                      const Icon(Icons.foggy,
                                          color: Colors.white, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Thunderstorm') ...[
                                      const Icon(Icons.water_drop,
                                          color: Colors.blue, size: 80),
                                    ] else if (snapshot.data['main']
                                            .toString() ==
                                        'Snow') ...[
                                      const Icon(Icons.cloudy_snowing,
                                          color: Colors.white, size: 80),
                                    ] else ...[
                                      const Icon(Icons.cloud,
                                          color: Colors.grey, size: 80),
                                    ]
                                  ]),
                                  Text(
                                    snapshot.data['main'].toString(),
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontFamily: 'Courier',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('  '),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Wind: ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        (snapshot.data['wind'] * 3.6)
                                                .toStringAsFixed(0) +
                                            ' km/h',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Humidity: ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data['humidity'].toString() +
                                            '%',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Lowest: ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data['temp_min']
                                                .toStringAsFixed(0) +
                                            '°C',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Highest: ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data['temp_max']
                                                .toStringAsFixed(0) +
                                            '°C',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Courier',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: SnackBar(
                          content: const Text('Invalid city name'),
                          action: SnackBarAction(
                            label: 'Retry',
                            onPressed: () {},
                          ),
                        ),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}

Future apicall(String place_text) async {
  if (place_text == '') {
    place_text = 'bangalore';
  }

  dynamic url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=" +
      place_text +
      "&appid=1713662edffcb4bd21a90bf9e43ee745&units=metric");

  final response = await http.get(url);
  print(response.body);
  final json = jsonDecode(response.body);
  print(json['weather'][0]['description']);

  final output = {
    'main': json['weather'][0]['main'],
    'temp': json['main']['temp'],
    'feels_like': json['main']['feels_like'],
    'pressure': json['main']['pressure'],
    'humidity': json['main']['humidity'],
    'name': json['name'],
    'wind': json['wind']['speed'],
    'temp_min': json['main']['temp_min'],
    'temp_max': json['main']['temp_max'],
  };

  return output;
}
