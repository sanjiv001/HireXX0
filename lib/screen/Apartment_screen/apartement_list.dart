// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class ApartmentList extends StatefulWidget {
//   @override
//   _ApartmentListState createState() => _ApartmentListState();
// }

// class _ApartmentListState extends State<ApartmentList> {
//   @override
//   Widget build(BuildContext context) {
//     final List<Vehicle> cars = Provider.of<List<Vehicle>>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Liste de Voitures"),
//         backgroundColor: Colors.green,
//         actions: [
//           IconButton(
//             icon: Icon(FontAwesomeIcons.heart),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (ctx) => StreamProvider<List<Vehicule>>.value(
//                       value: DBServices().getvehiculefav(CarType.car),
//                       child: Favories())));
//             },
//           )
//         ],
//       ),
//       body: cars == null
//           ? Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
//               ),
//             )
//           : cars.length == 0
//               ? Center(
//                   child: Text("Aucune voitures"),
//                 )
//               : ListView.builder(
//                   itemCount: cars.length,
//                   itemBuilder: (ctx, i) {
//                     final car = cars[i];
//                     return i == cars.length - 1
//                         ? Container(
//                             child: VCard(car: car),
//                             margin: EdgeInsets.only(bottom: 80),
//                           )
//                         : VCard(car: car);
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.green,
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (ctx) => AddCar()));
//         },
//       ),
//     );
//   }
// }
