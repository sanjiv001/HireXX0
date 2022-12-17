// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirexxo/model/apartment.dart';
import 'package:hirexxo/services/db.dart';
import 'package:hirexxo/utils/addscreen/getimage.dart';
import 'package:hirexxo/utils/addscreen/loading.dart';


class AddApartment extends StatefulWidget {
  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  final key = GlobalKey<FormState>();
  late String name, address, contact, price, description;
  List<File> images = [];
  Building apartment = Building(
      name: '',
      address: '',
      contact: '',
      price: '',
      images: [],
      description: '',
      type: ApartmentType.apartment);

  @override
  void initState() {
    super.initState();
    apartment.type = ApartmentType.apartment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Apartments"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 5, 169, 73),
          actions: const [Icon(FontAwesomeIcons.house)],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "" : null,
                    onChanged: (e) => name = e,
                    decoration: InputDecoration(
                        hintText: "Enter Owner Full Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "" : null,
                    onChanged: (e) => contact = e,
                    decoration: InputDecoration(
                        hintText: "Enter Owner Contact No.",
                        labelText: "Contact No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "" : null,
                    onChanged: (e) => address = e,
                    decoration: InputDecoration(
                        hintText: "Enter Full Address",
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e!.isEmpty ? "" : null,
                    onChanged: (e) => price = e,
                    decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "" : null,
                    onChanged: (e) => description = e,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Détailed Information",
                        labelText: "Détails",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4)),
                          margin: const EdgeInsets.only(right: 5, bottom: 5),
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: [
                              Image.file(
                                images[i],
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.minusCircle,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(i);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      InkWell(
                        onTap: () async {
                          final data = await showModalBottomSheet(
                              context: context,
                              builder: (ctx) {
                                return GetImage();
                              });
                          if (data != null) {
                            setState(() {
                              images.add(data);
                            });
                          }
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          color: const Color.fromARGB(255, 3, 185, 91),
                          child: const Icon(
                            FontAwesomeIcons.plusCircle,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal,
                        disabledForegroundColor:
                            const Color.fromARGB(255, 3, 160, 16)
                                .withOpacity(0.38),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () async {
                        if (key.currentState!.validate() && images.isNotEmpty) {
                          print(images);
                          loading(context);
                          apartment.name = name;
                          apartment.address = address;
                          apartment.price = price;
                          apartment.contact = contact;
                          apartment.description = description;
                          apartment.images = [];

                          for (var i = 0; i < images.length; i++) {
                            String? urlImage = await DBServices()
                                .uploadImage(images[i], path: "apartment");
                            if (urlImage != null) {
                              apartment.images.add(urlImage);
                            }
                          }
                          if (images.length == apartment.images.length) {
                            bool save =
                                await DBServices().savebuilding(apartment);
                            if (save) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                          }
                        } else {
                          print("nothing");
                        }
                      },
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Add",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 5, 152, 30),
                                  fontSize: 20)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
