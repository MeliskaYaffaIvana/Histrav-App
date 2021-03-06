import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/screens/edit_screen.dart';
import 'package:histrav_app_flutter/utils/database.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readItems(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index];
              String docID = snapshot.data!.docs[index].id;
              String destination = noteInfo['destination'];
              String city = noteInfo['city'];
              String description = noteInfo['description'];
              String price = noteInfo['price'];

              return Ink(
                decoration: BoxDecoration(
                  color: const Color(0xff61825F).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:  GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        currentdestination: destination,
                        currentcity: city,
                        currentdescription: description,
                        currentprice: price,
                        documentId: docID,
                      ),
                    ),
                  ),
                  
                  child: Text(
                    destination,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  child: Text(
                    city,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  child Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  child Text(
                    price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
               Color(0xff61825F),
            ),
          ),
        );
      },
    );
  }
}
