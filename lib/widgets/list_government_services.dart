import 'package:flutter/material.dart';
import 'package:government_services/model/government_services_data.dart';

class ListGovernmentServices extends StatelessWidget {
  const ListGovernmentServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...GovernmentServicesData.governmentServices.map(
            (e) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Text("${e['name']}"),
              );
            },
          ),
        ],
      ),
    );
  }
}
