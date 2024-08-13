import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(26), bottomEnd: Radius.circular(26)),
        color: Colors.blue.shade900,
      ),
      // color: const Color(0xFF011E3B),

      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardInfo(
                title: 'Ibrahim Islam Said', subTitle: 'Writer @MLT news'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 30),
                  child: Text(
                    'Browse'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 12.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
                ListMenuTile(tileTitle: 'Home', icon: CupertinoIcons.house),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
                ListMenuTile(tileTitle: 'Search', icon: CupertinoIcons.search),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
                ListMenuTile(
                    tileTitle: 'Favorites', icon: CupertinoIcons.heart),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
                ListMenuTile(
                    tileTitle: 'Latest news', icon: CupertinoIcons.news),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, top: 30),
                  child: Text(
                    'History'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                ListMenuTile(tileTitle: 'History', icon: CupertinoIcons.time),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
                ListMenuTile(
                    tileTitle: 'Notifications',
                    icon: Icons.notifications_none_outlined),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 4),
                  child: Divider(
                    height: 0.2,
                    color: Colors.white24,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(180)),
        child: Image.asset(
          'images/profile_pic.jpeg',
          height: 50,
          width: 50,
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ListMenuTile extends StatelessWidget {
  const ListMenuTile(
      {super.key, required this.tileTitle, required this.icon, this.onClick});

  final String tileTitle;
  final IconData icon;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
        title: Text(
          tileTitle,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        titleAlignment: ListTileTitleAlignment.threeLine,
        minLeadingWidth: 40,
      ),
    );
  }
}
