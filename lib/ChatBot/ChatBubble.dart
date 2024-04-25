import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  const ChatBubble({
    required this.sender,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final radius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: alignment == Alignment.centerLeft
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isMe ? Colors.blue[200] : Colors.green[200],
              borderRadius: radius,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.black87 : Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            sender,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:isMe ? Colors.black87 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}