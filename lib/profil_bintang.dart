import "package:flutter/material.dart";

class Postingan extends StatefulWidget {
  const Postingan({super.key});

  @override
  State<Postingan> createState() => _PostinganState();
}

class _PostinganState extends State<Postingan> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Profile picture, name, time
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=47', // Menggunakan placeholder online
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nama Pengguna',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '2 jam yang lalu',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(), // Untuk mendorong menu ke kanan
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Tambahkan fungsi menu di sini
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Post Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[300], // Placeholder color
                child: Image.network(
                  'https://picsum.photos/400/300', // Menggunakan placeholder image online
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
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
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Caption (opsional)
            const Text(
              'TEST TEST TEST TESTTES TEST TEST EST TEST',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}