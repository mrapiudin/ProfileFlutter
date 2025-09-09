import 'package:flutter/material.dart';
import 'bottom_button.dart'; // panggil bottom nav
import 'appbar.dart'; // panggil appbar & story
import 'profil_bintang.dart'; // Import halaman postingan

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
        title: GestureDetector(
          onTap: () {
            // Navigate ke halaman Postingan saat AppBar title diklik
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Postingan(),
              ),
            );
          },
          child: const Text(
            "ProfileTheree",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.black, size: 32),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal Stories dengan navigation ke postingan
          Container(
            height: 140,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StoryItem(
                  name: "Bintang",
                  imageUrl: "https://i.pravatar.cc/150?img=47",
                  onTap: () {
                    // Navigate ke halaman postingan Bintang
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostinganPage(
                          userName: "Bintang",
                          userImage: "https://i.pravatar.cc/150?img=47",
                          postImage: "https://picsum.photos/400/300?random=1",
                        ),
                      ),
                    );
                  },
                ),
                StoryItem(
                  name: "Rapiu",
                  imageUrl: "https://i.pravatar.cc/150?img=12",
                  onTap: () {
                    // Navigate ke halaman postingan Rapiu
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostinganPage(
                          userName: "Rapiu",
                          userImage: "https://i.pravatar.cc/150?img=12",
                          postImage: "https://picsum.photos/400/300?random=2",
                        ),
                      ),
                    );
                  },
                ),
                StoryItem(
                  name: "Kamila",
                  imageUrl: "https://i.pravatar.cc/150?img=56",
                  onTap: () {
                    // Navigate ke halaman postingan Kamila
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostinganPage(
                          userName: "Kamila",
                          userImage: "https://i.pravatar.cc/150?img=56",
                          postImage: "https://picsum.photos/400/300?random=3",
                        ),
                      ),
                    );
                  },
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
  final VoidCallback? onTap; // Tambahkan callback untuk tap

  const StoryItem({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isAddNew = false,
    this.onTap, // Optional tap callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap event
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tambahkan efek visual saat ditekan
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            child: CircleAvatar(
              radius: 40,
              backgroundColor:
                  isAddNew ? Colors.purpleAccent : Colors.grey.shade300,
              child: isAddNew
                  ? const Icon(Icons.add, color: Colors.white, size: 30)
                  : CircleAvatar(
                      radius: 38,
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Postingan yang dapat menerima parameter
class PostinganPage extends StatefulWidget {
  final String userName;
  final String userImage;
  final String postImage;

  const PostinganPage({
    super.key,
    required this.userName,
    required this.userImage,
    required this.postImage,
  });

  @override
  State<PostinganPage> createState() => _PostinganPageState();
}

class _PostinganPageState extends State<PostinganPage> {
  bool isLiked = false;
  int likeCount = 123;

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        isLiked = false;
        likeCount--;
      } else {
        isLiked = true;
        likeCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Postingan ${widget.userName}',
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Profile picture, name, time
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(widget.userImage),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '2 jam yang lalu',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Show menu options
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.share),
                              title: const Text('Bagikan'),
                              onTap: () => Navigator.pop(context),
                            ),
                            ListTile(
                              leading: const Icon(Icons.bookmark_border),
                              title: const Text('Simpan'),
                              onTap: () => Navigator.pop(context),
                            ),
                            ListTile(
                              leading: const Icon(Icons.report),
                              title: const Text('Laporkan'),
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Post Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.postImage,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey[300],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Like button and count
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                    size: 32,
                  ),
                  onPressed: _toggleLike,
                ),
                Text(
                  '$likeCount suka',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.comment, size: 28),
                  onPressed: () {
                    // Handle comment
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share, size: 28),
                  onPressed: () {
                    // Handle share
                  },
                ),
              ],
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
