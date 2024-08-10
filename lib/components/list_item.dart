import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.title,
      required this.author,
      required this.authorImage,
      required this.categoryName,
      required this.imageUrl,
      required this.publishDate,
      required this.onTapHandler});

  final String categoryName;
  final String title;
  final String author;
  final String authorImage;
  final DateTime publishDate;
  final String imageUrl;
  final VoidCallback onTapHandler;

  @override
  Widget build(BuildContext context) {
    // var item = Provider.of<NewsList>(context, listen: false).getItem(index);
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        height: 140.0,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            SizedBox(
              width: 160.0,
              height: 130.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Text('Your error widget...');
                  },
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    title.length < 50 ? title : title.substring(0, 50) + "...",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          authorImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        author.length < 20 ? author : author.substring(0, 20),
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        DateFormat('MMM dd/yyyy').format(publishDate),
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
