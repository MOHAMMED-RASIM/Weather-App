import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/model/forecastmodel.dart';
import 'package:weather/model/modelclass.dart';
import 'package:weather/model/provider.dart';
import 'package:weather/viewmodel/fetch_api.dart';
import 'package:weather/viewmodel/geocode.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}



class _HomepageState extends State<Homepage> {
  WeatherModel? obj;
  forecastmodel? fore;
  String cityy = '';

  Future<void> fetchdata() async {
    obj = await fetchWeather(context);
    fore = await Forecast(context);
  }

  var searchController = TextEditingController();

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Providerstate>(context);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: Switch(
                value: prov.changetheme,
                onChanged: (value) {
                  prov.switchmod(value);
                },
              ),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              elevation: 0,
              actions: [
                AnimSearchBar(
                    width: 350,
                    textController: searchController,
                    onSuffixTap: const Icon(Icons.search),
                    onSubmitted: (values) async {
                      cityy = values;
                      
                      await geocode(values).then((value) => {fetchdata()});
                      setState(() {});
                    }
                    )
              ],
            ),
            body: FutureBuilder(
                future: fetchdata(),
                builder: (context, snapshot) {
                  return fore != null && obj != null
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                "${obj?.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: prov.changetheme
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            Text(
                              "${obj?.temp}º",
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w300,
                                  color: prov.changetheme
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            Text(
                              '-${obj?.humidity}º    -65º',
                              style: TextStyle(
                                  color: prov.changetheme
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${obj?.description}",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: prov.changetheme
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: height / 5,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        height: height / 6,
                                        width: width / 4.4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: height / 88,
                                            ),
                                            Text(
                                              "${fore?.list[index].formattedDtTxt}",
                                              style: TextStyle(
                                                  color: prov.changetheme
                                                      ? Colors.white
                                                      : Colors.black),
                                            ),
                                            Image.network(
                                                'https://openweathermap.org/img/wn/${fore?.list[index].weather[0].icon}@2x.png'),
                                            Text(
                                              "${fore?.list[index].main.temp}º",
                                              style: TextStyle(
                                                color: prov.changetheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ));
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: width / 77,
                                    );
                                  },
                                  itemCount: 4),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tuesday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${fore?.list[1].weather[0].icon}.png'),
                                ),
                                Text(
                                  "${fore?.list[1].main.temp}º                 23.20º",
                                  style: TextStyle(
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'wednesday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${fore?.list[2].weather[0].icon}.png'),
                                ),
                                Text(
                                  "${fore?.list[2].main.temp}º                  23.20º",
                                  style: TextStyle(
                                    color: prov.changetheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Thursday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${fore?.list[3].weather[0].icon}.png'),
                                ),
                                Text(
                                  "${fore?.list[3].main.temp}º                  23.20º",
                                  style: TextStyle(
                                    color: prov.changetheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Friday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${fore?.list[4].weather[0].icon}.png'),
                                ),
                                Text(
                                  "${fore?.list[4].main.temp}º                  23.20º",
                                  style: TextStyle(
                                    color: prov.changetheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Saturday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${fore?.list[5].weather[0].icon}.png'),
                                ),
                                Text(
                                  "${fore?.list[5].main.temp}º                    23.20º",
                                  style: TextStyle(
                                    color: prov.changetheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Sunday',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: prov.changetheme
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Image.network(
                                      'https://openweathermap.org/img/wn/${fore?.list[6].weather[0].icon}.png'),
                                ),
                                Text(
                                  "${fore?.list[6].main.temp}º                  23.20º",
                                  style: TextStyle(
                                    color: prov.changetheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : const Center(
                          child: Text("Loading..."),
                        );
                })));
  }
}
