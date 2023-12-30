import 'package:flutter/material.dart';
import 'package:majestic_app/utils/constant.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/image_majestic.png',
          width: 250,
          fit: BoxFit.cover,
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'COMMUNAUTÉ',
            style: font(size: 23, colors: Colors.white),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.white,
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'BILLETERIE',
            style: font(size: 23, colors: Colors.white),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.white,
        ),
        ListTile(
          onTap: () {},
          title: Text(
            'INFOS PRATIQUES',
            style: font(size: 23, colors: Colors.white),
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.white,
        ),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, minimumSize: const Size(50, 50)),
            onPressed: () {},
            child: Text(
              'Mon compte',
              style: font(
                size: 18,
                colors: Colors.white,
              ),
            ))
      ],
    );
  }
}
