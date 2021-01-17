import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').snapshots(),
        builder: (ctx, chatSnapShot) {
          if (chatSnapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatDocs = chatSnapShot.data.docs;

          return ListView.builder(
            itemCount: chatDocs.length,
            itemBuilder: (ctx, i) => Text(
              chatDocs[i]['text'],
            ),
          );
        });
  }
}
