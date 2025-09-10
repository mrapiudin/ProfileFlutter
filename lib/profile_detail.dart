import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String rombel;
  final String alamat;
  final String gmail;
  final String nomorTelepon;
  final String keahlian;
  final ImageProvider photo;

  const ProfileData({
    required this.name,
    required this.rombel,
    required this.alamat,
    required this.gmail,
    required this.nomorTelepon,
    required this.keahlian,
    required this.photo,
  });
}

class ProfileDetailPage extends StatelessWidget {
  final ProfileData profile;

  const ProfileDetailPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEEEE),
        foregroundColor: const Color(0xFF000000),
        elevation: 0,
        title: Text(
          profile.name,
          style: const TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF5682B1),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Photo Section
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF5682B1),
                  width: 4,
                ),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profile.photo,
              ),
            ),
            const SizedBox(height: 24),
            
            // Profile Info Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Profil',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoTile(title: 'Nama', value: profile.name),
                  _buildInfoTile(title: 'Rombel', value: profile.rombel),
                  _buildInfoTile(title: 'Alamat', value: profile.alamat),
                  _buildInfoTile(title: 'Gmail', value: profile.gmail),
                  _buildInfoTile(title: 'Nomor Telepon', value: profile.nomorTelepon),
                  _buildInfoTile(title: 'Keahlian', value: profile.keahlian),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.message, color: Colors.white),
                    label: const Text(
                      'Kirim Pesan',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5682B1),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Color(0xFF5682B1)),
                    label: const Text(
                      'Bagikan',
                      style: TextStyle(color: Color(0xFF5682B1)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF5682B1)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({required String title, required String value}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE9ECEF),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$title:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF444444),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



