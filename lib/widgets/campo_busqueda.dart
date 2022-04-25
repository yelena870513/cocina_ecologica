import 'package:cocina_ecologica/constants/colors.dart';
import 'package:cocina_ecologica/constants/font_family.dart';
import 'package:flutter/material.dart';

class CampoBusqueda extends StatelessWidget {
  const CampoBusqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: AppColors.grisBase),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: size.width * 0.90,
      child: Row(
        children: [
          InkWell(
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          VerticalDivider(
            thickness: 2,
            indent: 10.0,
            endIndent: 10.0,
          ),
          Expanded(
              child: TextField(
                style: TextStyle(fontFamily: FontFamily.helveticaNeueLTStdCn, fontSize: 20.0),
                  decoration: InputDecoration(
                      hintText: 'Buscar', border: InputBorder.none)))
        ],
      ),
    );
  }
}
