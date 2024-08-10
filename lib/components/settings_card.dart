import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.bgIconColor});

  final String title;
  final String subTitle;
  final IconData icon;
  final Color bgIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(color: bgIconColor, shape: BoxShape.circle),
              child: Icon(
                icon,
                size: 30,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 22,
          color: Colors.grey,
        ),
      ],
    );
  }
}
