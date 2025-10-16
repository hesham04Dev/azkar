// import 'package:flutter/material.dart';
// import 'package:new_azkar/models/PrimaryContainer.dart';
// import '../../models/audio_fab.dart';
// import '/db/db.dart';
//
// class ZkrPage extends StatefulWidget {
//   // You can pass category info here
//   final Map<String, dynamic>? zkrCategory;
//
//   const ZkrPage({Key? key, this.zkrCategory}) : super(key: key);
//
//   @override
//   State<ZkrPage> createState() => _ZkrPageState();
// }
//
// class _ZkrPageState extends State<ZkrPage> {
//   List<Map<String, dynamic>> azkars = [];
//   List<Map<String,String>> tracks = [
//     // {"path": "assets/audio/affasy/bsmAllah.mp3", "repeat":"2"},
//     // {"path": "assets/audio/affasy/astkfr.mp3", "repeat":"1"},
//   ];
//
//
//
//   void _editRank(Map<String, dynamic> zkr) {
//     TextEditingController controller =
//         TextEditingController(text: zkr['rank'].toString());
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: MediaQuery.of(context).viewInsets,
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text("Edit Rank for ${zkr['name']}"),
//                 const SizedBox(height: 12),
//                 TextField(
//                   controller: controller,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: "New Rank",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 ElevatedButton(
//                   onPressed: () {
//                     int newRank = int.tryParse(controller.text) ?? zkr['rank'];
//                     _updateRanks(zkr, newRank);
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Update"),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void _updateRanks(Map<String, dynamic> zkr, int newRank) async{
//     int oldRank = zkr['rank'];
//
//
//
//     // setState(() {
//       // If moving down in the list
//       if (newRank > oldRank) {
//         for (var other in azkars) {
//           if (other['id'] != zkr['id'] &&
//               other['rank'] > oldRank &&
//               other['rank'] <= newRank) {
//             other['rank'] -= 1; // shift up
//           }
//         }
//       }
//       // If moving up in the list
//       else if (newRank < oldRank) {
//         for (var other in azkars) {
//           if (other['id'] != zkr['id'] &&
//               other['rank'] < oldRank &&
//               other['rank'] >= newRank) {
//             other['rank'] += 1; // shift down
//           }
//         }
//       }
//       zkr['rank'] = newRank;
//
//       // Sort by rank after update
//       azkars.sort((a, b) => a['rank'].compareTo(b['rank']));
//
//      // azkars.((zkr){ return "${zkr['id']} ${zkr['rank']}");
//
//       await AppDatabase.db.azkarDao.updateRanks(azkars);
//     // });
//   setState(() {
//
//   });
//     // TODO: here you should also update the DB with the new ranks
//   }
//
//   bool isLoading = true;
//
//   // audio mini player state
//   bool showMiniPlayer = false;
//   bool isPlaying = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadAzkars();
//   }
//
//   Future<void> _loadAzkars() async {
//     print("ddddddddddddd");
//     print( widget.zkrCategory!["id"],);
//     azkars = await AppDatabase.db.azkarDao.getAzkarByCategoryId(
//       widget.zkrCategory!["id"],
//     );
//     int i=1;
//     azkars.forEach((zkr){
//       zkr["rank"] = i;
//       i++;
//     });
//
//     setState(() {
//       isLoading = false;
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.zkrCategory?["name"] ?? "الأذكار")),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: azkars.length,
//               itemBuilder: (context, index) {
//                 final zkr = azkars[index];
//                 // tracks.add("assets/affasy/"+zkr["name"]+ ".mp3");
//                 tracks.add({"path": "assets/audio/affasy/${zkr["name"]}.mp3", "repeat":"${zkr["repeat"]}"});
//                 return PrimaryContainer(
//                   padding: 20,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(children: [
//                         IconButton(onPressed: (){
//                         _editRank(zkr);
//                       }, icon: Icon(Icons.sort))
//
//                       ],),
//                       Text(
//                         "${index + 1}. ${zkr['content']}",
//                         textAlign: TextAlign.justify,
//                         style: Theme.of(
//                           context,
//                         ).textTheme.bodyLarge?.copyWith(height: 1.5,fontFamily: 'Amiri'),
//                       ),
//
//                       const SizedBox(height: 16),
//
//                       // Repeat button
//                       PrimaryContainer(
//                         width: double.infinity,
//                         margin: 0,
//                         padding: 0,
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.symmetric(vertical: 15),
//                           ),
//                           onPressed: () {
//                             if (zkr["repeat"] > 0) {
//                               setState(() {
//                                 zkr["repeat"] -= 1;
//                               });
//                             }
//                           },
//                           child: Text(
//                             "${zkr["repeat"]}",
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//
//      floatingActionButton: ExpandingAudioButton(tracks: tracks,),
//      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '/db/db.dart';

// class ZkrPage extends StatefulWidget {
//   // You can pass category info here
//   final Map<String, dynamic>? zkrCategory;

//   const ZkrPage({Key? key, this.zkrCategory}) : super(key: key);

//   @override
//   State<ZkrPage> createState() => _ZkrPageState();
// }

// class _ZkrPageState extends State<ZkrPage> {
//   List<Map<String, dynamic>> azkars = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadAzkars();
//   }

//   Future<void> _loadAzkars() async {
//     azkars = await AppDatabase.db.azkarDao.getAzkarByCategoryId(widget.zkrCategory!["id"]);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.zkrCategory?["name"] ?? "الأذكار"),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//       padding: const EdgeInsets.all(12),
//       itemCount: azkars.length,
//       itemBuilder: (context, index) {
//         final zkr = azkars[index];
//         return Card(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(16),
//   ),
//   elevation: 1, // minimal Material 3 elevation
//   margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//   child: Padding(
//     padding: const EdgeInsets.all(16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Title (if you want it back later)
//         // Text(
//         //   zkr['title'] ?? 'Zkr ${index + 1}',
//         //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
//         //         fontWeight: FontWeight.bold,
//         //       ),
//         // ),

//         // Content
//         Text(
//           "${index + 1}. ${zkr['content']}",
//           textAlign: TextAlign.justify,
//           style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                 height: 1.5,
//               ),
//         ),

//         const SizedBox(height: 16),

//         // Repeat button
//         SizedBox(
//           width: double.infinity,
//           child: FilledButton.tonal(
//             style: FilledButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             onPressed: () {
//               if (zkr["rebeat"] > 0) {
//                 setState(() {
//                   zkr["rebeat"] -= 1;
//                 });
//               }
//             },
//             child: Text(
//               "${zkr["rebeat"]}",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );

//       },
//     )
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_azkar/models/PrimaryContainer.dart';
import 'package:new_azkar/pages/zkrPage/providers/zkr_provider.dart';
import 'package:new_azkar/pages/zkrPage/widgets/zkr.dart';
import 'package:new_azkar/rootProvider/audio_provider.dart';
import 'package:provider/provider.dart';
import '../../models/audio_fab.dart';
import '/db/db.dart';

class ZkrPage extends StatefulWidget {
  final Map<String, dynamic>? zkrCategory;

  const ZkrPage({Key? key, this.zkrCategory}) : super(key: key);

  @override
  State<ZkrPage> createState() => _ZkrPageState();
}

class _ZkrPageState extends State<ZkrPage> {
  List<Map<String, dynamic>> azkars = [];

  // bool isLoading = true;
  // final ScrollController _scrollController = ScrollController();
  // int currentPlayingIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  // void _scrollToZkr(int index) {
  //   if (index < 0 || index >= azkars.length) return;
  //   _scrollController.animateTo(
  //     index * 180, // approximate height per item
  //     duration: const Duration(milliseconds: 500),
  //     curve: Curves.easeInOut,
  //   );
  // }

  // void _onTrackChange(int index) {
  //   setState(() => currentPlayingIndex = index);
  //   _scrollToZkr(index);
  // }

  // void _onRepeatDecrease(int index) {
  //   setState(() {
  //     if (azkars[index]["repeat"] > 0) {
  //       azkars[index]["repeat"] -= 1;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    azkars = context.read<ZkrProvider>().azkars;
    var tracks = context.read<ZkrProvider>().tracks;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.zkrCategory?["name"] ?? "الأذكار"),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
            AudioProvider.stop();
          }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: ListView.builder(
        controller: context.read<ZkrProvider>().azkarsScroll,
        padding: const EdgeInsets.all(12),
        itemCount: azkars.length,
        itemBuilder: (context, index) {
          final zkr = azkars[index];
          // final isActive = index == context.read<ZkrProvider>().currentIndex;
          ZkrContainer x = ZkrContainer(index: index, zkr: zkr);
          return x;
        },
      ),
      floatingActionButton: widget.zkrCategory?["id"] ==3?null: ChangeNotifierProvider(
        create: (BuildContext context) => AudioProvider(tracks: tracks,context: context),
        child: ExpandingAudioButton(),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
