import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomAppBarBusqueda extends StatelessWidget
    implements PreferredSizeWidget {
  // ignore: prefer_final_fields

  const CustomAppBarBusqueda({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(
          top: 40,
          left: ResponsiveValue(
                context,
                defaultValue: 280.0,
                valueWhen: [
                  Condition.largerThan(
                    name: MOBILE,
                    value: 300.0,
                  )
                ],
              ).value ??
              0.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                child: Image.asset('assets/imagenes/iconos/icono_CERRAR.png',
                    width: 38, height: 38),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
