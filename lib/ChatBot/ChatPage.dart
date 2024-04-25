import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  ChatBubble({required this.sender, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8, right: 80),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isMe ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'ChatBot', 'text': 'Hello!', 'isMe': false},
    {'sender': 'You', 'text': 'Hi ChatBot! How are you?', 'isMe': true},
    {'sender': 'ChatBot', 'text': 'I am fine, thank you!', 'isMe': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ChatBubble(
                    sender: message['sender'],
                    text: message['text'],
                    isMe: message['isMe'],
                  );
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: TextField(
                onSubmitted: (value) {
                  setState(() async {
                    _messages.add({
                      'sender': 'You',
                      'text': value,
                      'isMe': true,
                    });

                    if (value.toLowerCase() == 'what are prices') {
                      _messages.add({
                        'sender': 'ChatBot',
                        'text':
                            'Our prices are: ${100} for a single room and ${200} for a double room.',
                        'isMe': false,
                      });
                    } else if (value.toLowerCase() ==
                        'do you travel outside pakistan') {
                           await Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                      _messages.add({
                        'sender': 'ChatBot',
                        'text':
                            'No, Sorry WildHeart Adventure is only Arrange Trips Indside the Pakistan only\nAnd In Future We Plan to Visit Country Like Turkey and Azerbijan',
                        'isMe': false,
                      });
                      });
                      });
                    } else if (value.toLowerCase() ==
                        'what are trip durations') {
                          await Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                      _messages.add({
                        'sender': 'ChatBot',
                        'text':
                            'The Normal Trip is of One Day and in Summers Vacations or Winters we Have Trips of 1 Week or 3-4 days ',
                        'isMe': false,
                      });
                      });});
                    } else if (value.toLowerCase() ==
                        'what accomandation you provide in trip') {
                          await Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                      _messages.add({
                        'sender': 'ChatBot',
                        'text':
                            'Our Trips Includes The Best Deal For you\nFood\nNightStays\nPhotography\nJamming Sessions',
                        'isMe': false,
                      });
                      });
                      });
                    } else {
                      _messages.add({
                        'sender': 'ChatBot',
                        'text': "I can't understand",
                        'isMe': false,
                      });
                    }
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Type your message',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
