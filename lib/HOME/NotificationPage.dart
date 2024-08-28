import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Danh sách các thông báo
  final List<Map<String, String>> notifications = [];

  // Danh sách tiêu đề và nội dung thông báo thể thao mẫu
  final List<Map<String, String>> sportsNotifications = [
    {
      'title': 'Kết quả trận đấu bóng đá',
      'content': 'Đội A đã thắng đội B với tỉ số 3-2 trong trận đấu kịch tính.',
    },
    {
      'title': 'Giải quần vợt quốc tế',
      'content': 'Tay vợt số 1 thế giới đã giành chiến thắng sau 3 set đấu căng thẳng.',
    },
    {
      'title': 'Tin tức về bóng rổ',
      'content': 'Đội bóng rổ X vừa ký hợp đồng với cầu thủ ngôi sao Y.',
    },
    {
      'title': 'Giải chạy marathon',
      'content': 'Hàng nghìn vận động viên đã tham gia cuộc thi marathon năm nay.',
    },
    {
      'title': 'Tin tức về cầu lông',
      'content': 'Giải cầu lông quốc tế sẽ diễn ra vào tháng tới với sự tham gia của nhiều tay vợt hàng đầu.',
    },
  ];

  // Hàm tạo thông báo ngẫu nhiên về thể thao
  Map<String, String> generateRandomNotification() {
    final random = Random();
    return sportsNotifications[random.nextInt(sportsNotifications.length)];
  }

  @override
  void initState() {
    super.initState();
    // Thêm thông báo đầu tiên
    notifications.add(generateRandomNotification());
    // Tạo timer để thêm thông báo mới mỗi 10 giây
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        notifications.add(generateRandomNotification());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo"),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationTile(
            title: notifications[index]['title']!,
            content: notifications[index]['content']!,
          );
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String content;

  NotificationTile({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationDetailPage(
              title: title,
              content: content,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final String title;
  final String content;

  NotificationDetailPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}


