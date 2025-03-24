import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class Tweet {
  final String userName;
  final String userInitial;
  final Color userColor;
  final String content;
  final String date;

  Tweet({
    required this.userName,
    required this.userInitial,
    required this.userColor,
    required this.content,
    required this.date,
  });
}

class TweetTile extends StatelessWidget {
  final Tweet tweet;

  const TweetTile({super.key, required this.tweet});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: tweet.userColor,
        child: Text(tweet.userInitial),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tweet.userName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(tweet.date),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tweet.content),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  // イイネボタンの処理
                },
              ),
              IconButton(
                icon: const Icon(Icons.repeat),
                onPressed: () {
                  // リツイートボタンの処理
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Tweet> tweets = [
    Tweet(
      userName: 'ユーザーA',
      userInitial: 'A',
      userColor: Colors.blue,
      content: 'これはユーザーAのツイートです。',
      date: '2025/03/24',
    ),
    Tweet(
      userName: 'ユーザーB',
      userInitial: 'B',
      userColor: Colors.green,
      content: 'これはユーザーBのツイートです。',
      date: '2025/03/24',
    ),
    Tweet(
      userName: 'ユーザーC',
      userInitial: 'C',
      userColor: Colors.red,
      content: 'これはユーザーCのツイートです。',
      date: '2025/03/25',
    ),
    Tweet(
      userName: 'ユーザーD',
      userInitial: 'D',
      userColor: Colors.orange,
      content: 'これはユーザーDのツイートです。',
      date: '2025/03/26',
    ),
    Tweet(
      userName: 'ユーザーE',
      userInitial: 'E',
      userColor: Colors.purple,
      content: 'これはユーザーEのツイートです。',
      date: '2025/03/27',
    ),
    Tweet(
      userName: 'ユーザーF',
      userInitial: 'F',
      userColor: Colors.yellow,
      content: 'これはユーザーFのツイートです。',
      date: '2025/03/28',
    ),
    Tweet(
      userName: 'ユーザーG',
      userInitial: 'G',
      userColor: Colors.cyan,
      content: 'これはユーザーGのツイートです。',
      date: '2025/03/29',
    ),
    Tweet(
      userName: 'ユーザーH',
      userInitial: 'H',
      userColor: Colors.brown,
      content: 'これはユーザーHのツイートです。',
      date: '2025/03/30',
    ),
    Tweet(
      userName: 'ユーザーI',
      userInitial: 'I',
      userColor: Colors.grey,
      content: 'これはユーザーIのツイートです。',
      date: '2025/03/31',
    ),
    Tweet(
      userName: 'ユーザーJ',
      userInitial: 'J',
      userColor: Colors.teal,
      content: 'これはユーザーJのツイートです。',
      date: '2025/04/01',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'コンブ@Flutter大学',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: tweets.map((tweet) => TweetTile(tweet: tweet)).toList(),
        ),
      ),
    );
  }
}
