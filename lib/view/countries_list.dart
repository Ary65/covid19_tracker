import 'package:covid19_tracker/constants/colors.dart';
import 'package:covid19_tracker/services/states_services.dart';
import 'package:covid19_tracker/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _searchController;
  }

  final StatesServices _statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  setState(
                    () {},
                  );
                },
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _statesServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                    height: 10, width: 89, color: Colors.white),
                                subtitle: Container(
                                    height: 10, width: 89, color: Colors.white),
                                leading: Container(
                                    height: 50, width: 50, color: Colors.white),
                                trailing: Container(
                                    height: 10, width: 89, color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    //  const Center(
                    //   child: SpinKitFadingCube(
                    //     color: kPrimaryColor,
                    //     size: 50,
                    //   ),
                    // );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (_searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              name: snapshot.data![index]
                                                  ['country'],
                                              totalcases: snapshot.data![index]
                                                  ['cases'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalRecovered: snapshot.data![index]
                                                  ['recovered'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              critcal: snapshot.data![index]
                                                  ['critical'],
                                              todayRecovered: snapshot.data![index]
                                                  ['todayRecovered'],
                                              test: snapshot.data![index]
                                                  ['tests'])));
                                },
                                child: ListTile(
                                  title:
                                      snapshot.data![index]['country'] != null
                                          ? Text(
                                              snapshot.data![index]['country'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          : const Text('Unknown'),
                                  subtitle: snapshot.data![index]['countryInfo']
                                              ['iso3'] !=
                                          null
                                      ? Text(
                                          snapshot.data![index]['countryInfo']
                                              ['iso3'],
                                        )
                                      : const Text('Unknown'),
                                  trailing:
                                      snapshot.data![index]['cases'] != null
                                          ? Text(
                                              snapshot.data![index]['cases']
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            )
                                          : const Text('Unknown'),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(_searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              name: snapshot.data![index]
                                                  ['country'],
                                              totalcases: snapshot.data![index]
                                                  ['cases'],
                                              totalDeaths: snapshot.data![index]
                                                  ['deaths'],
                                              totalRecovered: snapshot.data![index]
                                                  ['recovered'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              critcal: snapshot.data![index]
                                                  ['critical'],
                                              todayRecovered: snapshot.data![index]
                                                  ['todayRecovered'],
                                              test: snapshot.data![index]
                                                  ['tests'])));
                                },
                                child: ListTile(
                                  title:
                                      snapshot.data![index]['country'] != null
                                          ? Text(
                                              snapshot.data![index]['country'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          : const Text('Unknown'),
                                  subtitle: snapshot.data![index]['countryInfo']
                                              ['iso3'] !=
                                          null
                                      ? Text(
                                          snapshot.data![index]['countryInfo']
                                              ['iso3'],
                                        )
                                      : const Text('Unknown'),
                                  trailing:
                                      snapshot.data![index]['cases'] != null
                                          ? Text(
                                              snapshot.data![index]['cases']
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            )
                                          : const Text('Unknown'),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {}
                        return Container();
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
