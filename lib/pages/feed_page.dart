import 'package:flutter/material.dart';
import 'package:instagram/model/post_model.dart';
import 'package:instagram/model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story('Jazmin', 'assets/images/img.png'),
    Story('Sylvester', 'assets/images/img_1.png'),
    Story('Lavina', 'assets/images/img_2.png'),
    Story('Jazmin', 'assets/images/img.png'),
    Story('Sylvester', 'assets/images/img_1.png'),
    Story('Lavina', 'assets/images/img_2.png'),
  ];
  final List<Post> _posts = [
    Post('Brianne', 'assets/images/img_3.png', 'assets/images/img_4.png',
        'Consequatur nihil aliquid omnis consequatur'),
    Post('Henri', 'assets/images/img_5.png', 'assets/images/img_2.png',
        'Consequatur nihil aliquid omnis consequatur'),
    Post('Mariaon', 'assets/images/img_1.png', 'assets/images/img_1.png',
        'Consequatur nihil aliquid omnis consequatur'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Divider(),
              // #storiesAndWatchAll
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Stories',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text('Watch all',
                        style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),
              // #storyList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemsOfStory(story);
                  }).toList(),
                ),
              ),
              // #postList
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i) {
                    return _itemOfPost(_posts[i]);
                  },
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              )
            ],
          ),
        ));
  }

  Widget _itemOfPost(Post post) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // #header
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(post.userName,style: TextStyle(color: Colors.grey),),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ),
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            placeholder: const AssetImage('assets/images/img_2.png'),
            image: AssetImage(post.postImage),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite_outline,color: Colors.grey,)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.comment,color: Colors.grey,)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send,color: Colors.grey,))
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark,color: Colors.grey,))
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey,),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey,),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey,),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey,),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color:  Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey,),
                  ),
                ],
              ),
            ),
          ),
          // #caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(children: [
                TextSpan(
                  text: post.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: ' ${post.caption}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ]),
            ),
          ),
          // #postDate
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              'February 2022',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemsOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xff8e44ad),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                image: AssetImage(story.image),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(story.name,style: TextStyle(color: Colors.grey),),
      ],
    );
  }
}
