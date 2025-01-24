import 'package:ephyli/theme/themes.dart';
import 'package:flutter/material.dart';

class TowerWidget extends StatefulWidget {

  List<List<bool>> stages;

  @override
  State<TowerWidget> createState() => _TowerWidgetState();

  TowerWidget(this.stages);

}

class _TowerWidgetState extends State<TowerWidget> {

  bool towerFilled() {
    for (int i = 0; i < widget.stages.length; i++) {
      for (int j = 0; j < widget.stages[i].length; j++) {
        if (!widget.stages[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        // Top decoration (triangular roof)
        towerFilled() ? Container(
          width: 140,
          height: 50,
          decoration: BoxDecoration(
            color: Themes.primaryColorDark,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 30,
            ),
          ),
        ) : SizedBox(
          width: 140,
          height: 50,
        ),

        // The tower body
        Column(
          children: widget.stages.map((floor) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: floor.map((brick) {
                return brick == true ? Container(
                  width: 20,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    border: Border.all(color: Colors.black, width: 0.7),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ) : Container(
                  width: 20,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.7),
                  ),
                );
              },).toList(),
            );
          },).toList(),
        ),

        // Base of the tower
        Container(
          width: 180,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

}