import 'package:flutter/material.dart';
import 'profile_detail.dart';

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
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEEEE),
        title: const Text(
          "SnapSy",
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xFF5682B1),
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal Stories dengan jarak merata dan posisi tengah
          Container(
            height: 160,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Stories",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
    return InkWell(
      onTap: () {
        if (name.toLowerCase() == 'bintang') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProfileDetailPage(
                profile: ProfileData(
                  name: 'Bintang',
                  rombel: 'RPL X-1',
                  alamat: 'Jl. Mawar No. 10, Bandung',
                  gmail: 'bintang@example.com',
                  nomorTelepon: '0812-3456-7890',
                  keahlian: 'Flutter, UI/UX, Photography',
                  photo: const AssetImage('assets/images/bintang.jpg'),
                ),
              ),
            ),
          );
        } else if (name.toLowerCase() == 'rapiu' || name.toLowerCase() == 'kamil') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProfileDetailPage(
                profile: ProfileData(
                  name: 'Rapiudin',
                  rombel: 'RPL X-2',
                  alamat: 'Jl. Melati No. 5, Cimahi',
                  gmail: 'rapiu@example.com',
                  nomorTelepon: '0813-9876-5432',
                  keahlian: 'Backend, Database, Public Speaking',
                  photo: NetworkImage(imageUrl),
                ),
              ),
            ),
          );
        } 
        else if (name.toLowerCase() == 'kamila' || name.toLowerCase() == 'kamil') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProfileDetailPage(
                profile: ProfileData(
                  name: 'Kamila',
                  rombel: 'RPL X-2',
                  alamat: 'Jl. Melati No. 5, Cimahi',
                  gmail: 'kamila@example.com',
                  nomorTelepon: '0813-9876-5432',
                  keahlian: 'Backend, Database, Public Speaking',
                  photo: NetworkImage(imageUrl),
                ),
              ),
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF5682B1),
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: isAddNew ? const Color(0xFF5682B1) : Colors.white,
              child: isAddNew
                  ? const Icon(Icons.add, color: Colors.white, size: 30)
                  : CircleAvatar(
                      radius: 37,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
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
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
