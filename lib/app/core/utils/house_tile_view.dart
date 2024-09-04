import 'package:flutter/material.dart';
import 'package:solution/app/core/constants/constant.dart';
import 'package:solution/app/data/models/house_model.dart';

  class HouseDetailsTile extends StatelessWidget {
  final House data;

  const HouseDetailsTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    House house = data;

    return ExpansionTile(
      title: Text(house.name),
      subtitle: Text("${Constants.founderOption}: ${house.founder}"),
      children: [
        ListTile(
          title: Text("${Constants.houseColorsOption}: ${house.houseColours}"),
        ),
        ListTile(
          title: Text("${Constants.animalOption}: ${house.animal}"),
        ),
        ListTile(
          title: Text("${Constants.elementOption}: ${house.element}"),
        ),
        ListTile(
          title: Text("${Constants.commonRoomOption}: ${house.commonRoom}"),
        ),
        ListTile(
          title: Text("${Constants.ghostOption}: ${house.ghost}"),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            Constants.notableOption,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...house.heads.map<Widget>((head) => ListTile(
          title: Text("${head.firstName} ${head.lastName}"),
        )),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "${Constants.traitOption}:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...house.traits.map<Widget>((trait) => ListTile(
          title: Text(trait.name),
        )),
      ],
    );
  }
}
