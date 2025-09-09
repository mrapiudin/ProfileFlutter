import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarPage());
}

class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProfileTheree',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "SnapSy",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                StoryItem(
                  name: "Bintang",
                  imageUrl: 'assets/images/star.jpg',
                ),
                StoryItem(
                  name: "Rapiu",
                  imageUrl: 'assets/images/rapiu.jpg',
                ),
                StoryItem(
                  name: "Kamila",
                  imageUrl: 'assets/images/kamil.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isAddNew;

  const StoryItem({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isAddNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor:
              isAddNew ? Colors.purpleAccent : Colors.grey.shade300,
          child: isAddNew
              ? const Icon(Icons.add, color: Colors.white, size: 30)
              : CircleAvatar(
                  radius: 38, 
                  backgroundImage: AssetImage(imageUrl),
                ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80, 
          child: Text(
            name,
            textAlign: TextAlign.center, 
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}