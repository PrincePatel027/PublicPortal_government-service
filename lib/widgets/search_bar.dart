import 'package:flutter/material.dart';
import 'package:government_services/provider/search_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  CustomSearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      // color: Colors.black12,
      alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: searchController,
        onSubmitted: (str) {
          Provider.of<SearchProvider>(context, listen: false).getURL(uRL: str);
          (str.isNotEmpty) ? Navigator.of(context).pushNamed('search') : null;
          // ignore: avoid_print
          print(searchController.text);
        },
        decoration: InputDecoration(
          filled: true,
          focusColor: Colors.green,
          hintText: "Search Here",
          hintStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.blue), // Default border color
          ),
          fillColor: Colors.blue[100],
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Colors.green,
              width: 2.0,
            ), // Border color when typing
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
