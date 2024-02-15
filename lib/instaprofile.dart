import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instaprofile/editbar.dart';
import 'package:instaprofile/insta_post_model.dart';
import 'package:instaprofile/postview.dart';

class InstaProfile extends StatefulWidget {
  const InstaProfile({super.key});

  @override
  State<InstaProfile> createState() => _InstaProfileState();
}

class _InstaProfileState extends State<InstaProfile> {
  var list = <InstaPostModel>[
    InstaPostModel(
      images: ["images/1.jpg"],
      caption: "This is caption",
      hashtags: "#o7services #instCaptions",
    ),
    InstaPostModel(
      images: ["images/1.jpg", "images/1.jpg"],
      caption: "This is Second Caption",
      hashtags: "#o7services #instCaptions",
    ),
    InstaPostModel(
      images: ["images/1.jpg", "images/1.jpg", "images/1.jpg"],
      caption: "This is Third Caption",
      hashtags: "#o7services #instCaptions",
    )
  ];
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
        // child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  ProfileDetail("0", "posts"),
                  ProfileDetail("232", "followers"),
                  ProfileDetail("282", "following"),
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

              Expanded(
                  child: GridView.builder(
                      itemCount: list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PostView(instaPostModel: list[index])));
                          },
                          child: Container(
                              margin: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(list[index].images![0])))),
                        );
                      })))
            ],
          ),
        ),
      ),
      // ),
    );
  }

  Widget ProfileDetail(String count, String title) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
