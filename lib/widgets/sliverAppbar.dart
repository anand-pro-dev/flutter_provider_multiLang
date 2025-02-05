// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:mshora/utils/constants.dart';
// import 'package:mshora/widgets/common_widget.dart';

// class DetailsScreen extends StatefulWidget {
//   const DetailsScreen({super.key});

//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               title: Row(
//                 children: [
//                   roundedContainer(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       borderRadius: 100,
//                       color: Colors.black.withOpacity(0.5),
//                       padding: EdgeInsets.all(10),
//                       child: Center(
//                         child: Icon(Icons.chevron_left),
//                       )),
//                   Spacer(),
//                 ],
//               ),
//               expandedHeight: 300.0,
//               stretch: true,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: false,
//                 background: Image.asset(
//                   "assets/images/131aa9801adcd1666932e0eb2b52f096.png",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [],
//                   ),
//                 )
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
