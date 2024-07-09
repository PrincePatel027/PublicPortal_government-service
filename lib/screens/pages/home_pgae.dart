import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:government_services/model/government_services_data.dart';
import 'package:government_services/provider/bookmark_provider.dart';
import 'package:government_services/widgets/list_government_services.dart';
import 'package:government_services/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  var courselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: const Text(
          "PublicPortal",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          PopupMenuButton<String>(
            // onSelected: (String result) {
            //   Navigator.pushNamed(context, 'detailPage', arguments: result);
            // },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              ...Provider.of<BookmarkProvider>(context, listen: false)
                  .bookmarkList
                  .map(
                (e) {
                  return PopupMenuItem<String>(
                    child: Text('$e'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(searchController: searchController),
            const SizedBox(height: 16),
            CarouselSlider(
              carouselController: courselController,
              items: GovernmentServicesData.governmentServices.map((e) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(
                        '${e['image']}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.blue.withOpacity(0.3),
                              Colors.purple.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 4,
                autoPlay: true,
                animateToClosest: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Government Services",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            const ListGovernmentServices(),
            const SizedBox(height: 16),
            Text(
              "Official Pages",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: GovernmentServicesData.governmentServices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "${GovernmentServicesData.governmentServices[index]['image']}",
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue[100],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[700]!.withOpacity(0.3),
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(16),
                                top: Radius.circular(12),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "${GovernmentServicesData.governmentServices[index]['name']}",
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_right_alt),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        'detailPage',
                                        arguments: GovernmentServicesData
                                            .governmentServices[index],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //   image: AssetImage(
                                //     "${GovernmentServicesData.governmentServices[index]['image']}",
                                //   ),
                                //   fit: BoxFit.cover,
                                //   opacity: 0.2,
                                // ),
                                ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              "${GovernmentServicesData.governmentServices[index]['agency']}",
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
