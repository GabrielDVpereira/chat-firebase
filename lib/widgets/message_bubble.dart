import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool belongsToMe;
  final Key key;

  MessageBubble(this.message, this.belongsToMe, {this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment:
            belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: 140,
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: belongsToMe
                  ? Colors.grey[300]
                  : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft:
                    belongsToMe ? Radius.circular(12) : Radius.circular(0),
                bottomRight:
                    belongsToMe ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: belongsToMe ? Colors.black : Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
