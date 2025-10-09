import 'package:flutter/material.dart';
import 'package:new_azkar/db/db.dart';
import '../../../zkrPage/zkrPage.dart' show ZkrPage;
import '/config/const.dart';
import '/models/PrimaryContainer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<ZkrCategory> azkarCategories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    azkarCategories = await AppDatabase.db.azkarDao.getAzkarCategories();
    print(azkarCategories);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: azkarCategories.length,
              itemBuilder: (context, index) {
                final category = azkarCategories[index];
                return PrimaryContainer(
                  
                  child: TextButton(
                   child:Text(category.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
            builder: (context) => ZkrPage(
              zkrCategory: {
                "id": category.id,
                "name": category.name,
              },
            ),
                      ),
                    );
                  },)
                );
              },
            ),
    );
  }
}

// Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
        
//         children: [
//           Expanded(
//             child: isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//               itemCount: azkarCategories.length,
//               itemBuilder: (context, index) {
//                 final category = azkarCategories[index];
//                 return PrimaryContainer(
                  
//                   child: TextButton(
//                    child:Text(category.name,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//             builder: (context) => ZkrPage(
//               zkrCategory: {
//                 "id": category.id,
//                 "name": category.name,
//               },
//             ),
//                       ),
//                     );
//                   },)
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );


// Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: ListTile(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           leading: CircleAvatar(
//             backgroundColor: Colors.teal.shade100,
//             child: Icon(Icons.book, color: Colors.teal),
//           ),
//           title: Text(
//             category.name,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ZkrPage(
//                   zkrCategory: {
//                     "id": category.id,
//                     "name": category.name,
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),