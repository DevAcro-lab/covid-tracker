import 'package:covid_tracker/Services/state_service.dart';
import 'package:covid_tracker/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchCountryByName = TextEditingController();
  StateServices stateServices = StateServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchCountryByName,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search Country by Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.fetchCountriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: ListTile(
                            leading: Container(
                                height: 50, width: 50, color: Colors.white),
                            title: Container(
                                height: 10, width: 90, color: Colors.white),
                            subtitle: Container(
                                height: 10, width: 50, color: Colors.white),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String countryName = snapshot.data![index]['country'];
                        if (searchCountryByName.text.isEmpty) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            flag: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            title: snapshot.data![index]
                                                ['country'],
                                            cases: snapshot.data![index]
                                                ['cases'],
                                            deaths: snapshot.data![index]
                                                ['deaths'],
                                            recovered: snapshot.data![index]
                                                ['recovered'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            continent: snapshot.data![index]
                                                ['continent'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                          )));
                            },
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']),
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                            ),
                          );
                        } else if (countryName
                            .toLowerCase()
                            .contains(searchCountryByName.text)) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            flag: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                            title: snapshot.data![index]
                                                ['country'],
                                            cases: snapshot.data![index]
                                                ['cases'],
                                            deaths: snapshot.data![index]
                                                ['deaths'],
                                            recovered: snapshot.data![index]
                                                ['recovered'],
                                            active: snapshot.data![index]
                                                ['active'],
                                            continent: snapshot.data![index]
                                                ['continent'],
                                            critical: snapshot.data![index]
                                                ['critical'],
                                          )));
                            },
                            child: ListTile(
                              leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag']),
                              ),
                              title: Text(snapshot.data![index]['country']),
                              subtitle: Text(
                                  snapshot.data![index]['cases'].toString()),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
