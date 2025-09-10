import 'package:flutter/material.dart';
import 'bottom_button.dart'; // panggil bottom nav
import 'appbar.dart';       // panggil appbar & story
import 'postingan.dart'; // panggil profil bintang
import 'profile_detail.dart'; // panggil profile detail

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zutto UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5682B1),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFEEEEEE),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFEEEEEE),
          foregroundColor: Color(0xFF000000),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.bold),
          titleLarge: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w600),
          titleMedium: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w600),
          titleSmall: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(color: Color(0xFF444444)),
          bodyMedium: TextStyle(color: Color(0xFF444444)),
          bodySmall: TextStyle(color: Color(0xFF666666)),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(), // arahkan ke MainScreen
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePageWithPosts(), // Homepage dengan postingan
    Placeholder(), // Search
    Placeholder(), // Notifications
    Placeholder(), // Profile
    Postingan(), // Profile tab menampilkan Postingan
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final String profileImage;
  final String username;
  final String timeAgo;
  final String postImage;
  final String caption;
  final int likes;

  const PostWidget({
    super.key,
    required this.profileImage,
    required this.username,
    required this.timeAgo,
    required this.postImage,
    required this.caption,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header dengan foto profil, nama, dan waktu
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImage),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        timeAgo,
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0xFF666666),
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          
          // Gambar postingan
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
              image: DecorationImage(
                image: NetworkImage(postImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Action buttons dan caption
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Action buttons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.chat_bubble_outline,
                        color: Color(0xFF5682B1),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Color(0xFF5682B1),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark_border,
                        color: Color(0xFF5682B1),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                
                // Likes count
                Text(
                  '$likes likes',
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Caption
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$username ',
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: caption,
                        style: const TextStyle(
                          color: Color(0xFF444444),
                          fontSize: 14,
                        ),
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

class HomePageWithPosts extends StatelessWidget {
  const HomePageWithPosts({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stories Section
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
                        _buildStoryItem(
                          context: context,
                          name: "Bintang",
                          imageUrl: "https://i.pravatar.cc/150?img=47",
                        ),
                        _buildStoryItem(
                          context: context,
                          name: "Rapiu",
                          imageUrl: "https://i.pravatar.cc/150?img=12",
                        ),
                        _buildStoryItem(
                          context: context,
                          name: "Kamila",
                          imageUrl: "https://i.pravatar.cc/150?img=56",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Posts Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Posts",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Sample Posts
            PostWidget(
              profileImage: "https://i.pravatar.cc/150?img=47",
              username: "Bintang",
              timeAgo: "2 jam yang lalu",
              postImage: "https://picsum.photos/400/400?random=1",
              caption: "Hari yang indah untuk coding! 🚀 Flutter development is so much fun!",
              likes: 24,
            ),
            
            PostWidget(
              profileImage: "https://i.pravatar.cc/150?img=12",
              username: "Rapiu",
              timeAgo: "5 jam yang lalu",
              postImage: "https://picsum.photos/400/400?random=2",
              caption: "Belajar backend development hari ini. Database design is challenging but exciting! 💻",
              likes: 18,
            ),
            
            PostWidget(
              profileImage: "https://i.pravatar.cc/150?img=56",
              username: "Kamila",
              timeAgo: "1 hari yang lalu",
              postImage: "https://picsum.photos/400/400?random=3",
              caption: "Public speaking workshop was amazing! Gained so much confidence today. 🎤✨",
              likes: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryItem({required BuildContext context, required String name, required String imageUrl}) {
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
        } else if (name.toLowerCase() == 'rapiu') {
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
        } else if (name.toLowerCase() == 'kamila') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProfileDetailPage(
                profile: ProfileData(
                  name: 'Kamila',
                  rombel: 'RPL X-2',
                  alamat: 'Jl. Anggrek No. 15, Bandung',
                  gmail: 'kamila@example.com',
                  nomorTelepon: '0814-5678-9012',
                  keahlian: 'Frontend, Design, Public Speaking',
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
              backgroundColor: Colors.white,
              child: CircleAvatar(
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