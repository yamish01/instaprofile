import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaprofile/editbar.dart';

class InstaProfile extends StatefulWidget {
  const InstaProfile({super.key});

  @override
  State<InstaProfile> createState() => _InstaProfileState();
}

class _InstaProfileState extends State<InstaProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.lock),
        title: const Text(
          "i_yamish",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_to_photos)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage("images/1.jpg"),
                          ),
                          border: Border.all(width: 3)),
                    ),
                    const Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "posts",
                          style: TextStyle(fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "232",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "followers",
                          style: TextStyle(fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          "282",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "following",
                          style: TextStyle(fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.sizeOf(context).width,
                  height: 70,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "yamish",
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                      Text(
                        "@yamish",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "bio",
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                editbar(), //in this there are 'edit profile and share profile container with icon'
              ],
            ),
          ),
        ),
      ),
    );
  }
}
