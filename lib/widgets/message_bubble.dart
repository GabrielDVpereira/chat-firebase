import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool belongsToMe;
  final Key key;
  final String username;
  final String userImage;

  MessageBubble(this.message, this.username, this.userImage, this.belongsToMe,
      {this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
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
                  vertical: 15,
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
                child: Column(
                  crossAxisAlignment: belongsToMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: belongsToMe ? Colors.black : Colors.white,
                      ),
                      textAlign: belongsToMe ? TextAlign.end : TextAlign.start,
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        color: belongsToMe ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 0,
            left: belongsToMe ? null : 125,
            right: belongsToMe ? 125 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(this.userImage),
            ),
          ),
        ],
      ),
    );
  }
}
