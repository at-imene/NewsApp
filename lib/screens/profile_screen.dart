import 'package:flutter/material.dart';
import 'package:news_app/components/settings_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add_a_photo_outlined),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.edit)
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(180)),
                    child: Image.asset(
                      'images/profile_pic.jpeg',
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Ibrahim Islam Said',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Writter ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '@CNN news',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 150,
                width: size.width,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue.shade200),
                child: Stack(
                  children: [
                    Positioned(
                        right: 5,
                        bottom: -20,
                        width: 200,
                        height: 180,
                        child: Image.asset(
                          'images/illustration.png',
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 280,
                            child: Text(
                              'Hey, it seems like you haven\'t add any article yet.',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 170,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade200,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.add),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Add new article',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account settings ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SettingsCard(
                      title: 'Your profile',
                      subTitle: 'Edit and view profile info',
                      icon: Icons.person_2_outlined,
                      bgIconColor: Colors.purple.shade100),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'App settings ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SettingsCard(
                      title: 'Notification',
                      subTitle: 'On/Off your notification',
                      icon: Icons.notifications_active_outlined,
                      bgIconColor: Colors.orange.shade100),
                  SizedBox(
                    height: 16,
                  ),
                  SettingsCard(
                      title: 'Display',
                      subTitle: 'Edit and view profile info',
                      icon: Icons.light_mode_outlined,
                      bgIconColor: Colors.green.shade100),
                  SizedBox(
                    height: 16,
                  ),
                  SettingsCard(
                      title: 'Favorite',
                      subTitle: 'Save your favorite news',
                      icon: Icons.favorite_border,
                      bgIconColor: Colors.red.shade100),
                  SizedBox(
                    height: 16,
                  ),
                  SettingsCard(
                      title: 'Articles',
                      subTitle: 'Your articles are shining',
                      icon: Icons.article_outlined,
                      bgIconColor: Colors.blue.shade100),
                ],
              )
            ]),
      ),
    );
  }
}
