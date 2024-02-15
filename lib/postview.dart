import 'package:flutter/material.dart';
import 'package:instaprofile/insta_post_model.dart';
import 'package:instaprofile/instaprofile.dart';

class PostView extends StatefulWidget {
  final InstaPostModel instaPostModel;
  const PostView({super.key, required this.instaPostModel});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InstaProfile()));
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "posts",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                          "images/1.jpg",
                        )),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  WidgetProfileText("I_yamish", "jalandhar", "double_take"),
                  const Spacer(
                    flex: 1,
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.instaPostModel.images?.length ?? 0,
                      itemBuilder: (context, index) {
                        var images = widget.instaPostModel.images;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            images?[index] ?? "",
                            fit: BoxFit.fill,
                          ),
                        );
                      })),
              Container(
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    Icon(Icons.chat_bubble_outline_rounded),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(Icons.send_sharp),
                    ),
                    Spacer(),
                    Icon(Icons.bookmark_border_sharp)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

WidgetProfileText(
  String first,
  String second,
  String third,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        first,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      ),
      Text(
        second,
        style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 8),
      ),
      Row(
        children: [
          const Icon(
            Icons.music_note,
            size: 8,
          ),
          Text(
            third,
            style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 8),
          ),
        ],
      ),
    ],
  );
}
