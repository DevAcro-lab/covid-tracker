import 'package:covid_tracker/View/world_states.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String title, continent, flag;
  int cases, deaths, recovered, critical, active;

  DetailScreen(
      {required this.title,
      required this.cases,
      required this.deaths,
      required this.recovered,
      required this.active,
      required this.continent,
      required this.critical,
      required this.flag});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      ReuseableRow(
                        title: 'Continent',
                        value: widget.continent.toString(),
                      ),
                      ReuseableRow(
                        title: 'Cases',
                        value: widget.cases.toString(),
                      ),
                      ReuseableRow(
                        title: 'Deaths',
                        value: widget.deaths.toString(),
                      ),
                      ReuseableRow(
                        title: 'Recovered',
                        value: widget.recovered.toString(),
                      ),
                      ReuseableRow(
                        title: 'Active',
                        value: widget.active.toString(),
                      ),
                      ReuseableRow(
                        title: 'Critical',
                        value: widget.critical.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.flag),
              ),
            ],
          )
        ],
      ),
    );
  }
}
