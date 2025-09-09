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
          // Horizontal Stories dengan jarak merata dan posisi tengah
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribusi merata
              crossAxisAlignment: CrossAxisAlignment.center, // Posisi tengah vertikal
              children: [
                StoryItem(
                  name: "Bintang",
                  imageUrl: "https://i.pravatar.cc/150?img=47",
                ),
                StoryItem(
                  name: "Rapiu",
                  imageUrl: "https://i.pravatar.cc/150?img=12",
                ),
                StoryItem(
                  name: "Kamila",
                  imageUrl: "https://i.pravatar.cc/150?img=56",
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
      mainAxisAlignment: MainAxisAlignment.center, // Posisi tengah vertikal
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor:
              isAddNew ? Colors.purpleAccent : Colors.grey.shade300,
          child: isAddNew
              ? const Icon(Icons.add, color: Colors.white, size: 30)
              : CircleAvatar(
                  radius: 38, // Sedikit lebih kecil untuk border effect
                  backgroundImage: NetworkImage(imageUrl),
                ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80, // Fixed width untuk konsistensi
          child: Text(
            name,
            textAlign: TextAlign.center, // Text di tengah
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