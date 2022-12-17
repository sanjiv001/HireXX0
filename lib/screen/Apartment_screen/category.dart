import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child:
                    Icon(FontAwesomeIcons.house, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (ctx) => StreamProvider<List<Vehicule>>.value(
              //         value: DBServices().getvehicule(type: CarType.moto),
              //         child: MotoList(),
              //       ),
              //     ),
              //   );
              // },
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.lightBlue,
                child:
                    Icon(FontAwesomeIcons.hotel, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (ctx) => StreamProvider<List<Vehicule>>.value(
              //         value: DBServices().getvehicule(type: CarType.moto),
              //         child: MotoList(),
              //       ),
              //     ),
              //   );
              // },
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.lightBlue,
                child: Icon(FontAwesomeIcons.motorcycle,
                    size: 50, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
