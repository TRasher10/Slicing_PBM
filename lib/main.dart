import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile JKN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A99D)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildGreeting(),
                const SizedBox(height: 12),
                _buildAntreanCard(),
                const SizedBox(height: 16),
                _buildMenuGrid(),
                const SizedBox(height: 16),
                _buildJanjiLayanan(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF00BDB0), Color(0xFF009688)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.only(top: 48, left: 12, right: 12, bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'mobile\nJKN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A99D),
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
                decoration: const InputDecoration(
                  hintText: 'Info Peserta, Info Iuran, Perubah...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 18),
                  border: InputBorder.none, 
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          const Icon(Icons.notifications_outlined, color: Colors.white, size: 26),

          const SizedBox(width: 8),

          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.grey.shade400, size: 28),
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Hi, RIVAT ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.verified, color: Color(0xFF00A99D), size: 18),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF00A99D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Aktif',
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
            ],
          ),
          const Text(
            'v4.16.1',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAntreanCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFE0F7F5),
              borderRadius: BorderRadius.circular(35),
            ),
            child: const Icon(
              Icons.people_alt_outlined,
              color: Color(0xFF00A99D),
              size: 36,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Antrean Online',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00A99D),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Untuk kunjungan lebih efisien tanpa harus menunggu lama.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF00BDB0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text('Ambil Antrean', style: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.phone_android, 'label': 'Info Program JKN', 'color': const Color(0xFFE3F2FD), 'iconColor': const Color(0xFF1976D2)},
      {'icon': Icons.videocam_outlined, 'label': 'TELEHEALTH', 'color': const Color(0xFFE8F5E9), 'iconColor': const Color(0xFF388E3C)},
      {'icon': Icons.medical_services_outlined, 'label': 'Info Riwayat Pelayanan', 'color': const Color(0xFFE8F5E9), 'iconColor': const Color(0xFF00897B)},
      {'icon': Icons.directions_run, 'label': 'Bugar', 'color': const Color(0xFFE3F2FD), 'iconColor': const Color(0xFF0288D1)},
      {'icon': Icons.healing_outlined, 'label': 'NEW Rehab (Cicilan)', 'color': const Color(0xFFE8F5E9), 'iconColor': const Color(0xFF00796B)},
      {'icon': Icons.person_add_outlined, 'label': 'Penambahan Peserta', 'color': const Color(0xFFF3E5F5), 'iconColor': const Color(0xFF7B1FA2)},
      {'icon': Icons.info_outlined, 'label': 'Info Peserta', 'color': const Color(0xFFE0F7FA), 'iconColor': const Color(0xFF00838F)},
      {'icon': Icons.sos, 'label': 'SOS', 'color': const Color(0xFFFFEBEE), 'iconColor': const Color(0xFFC62828)},
      {'icon': Icons.location_on_outlined, 'label': 'Info Lokasi Faskes', 'color': const Color(0xFFE8F5E9), 'iconColor': const Color(0xFF2E7D32)},
      {'icon': Icons.edit_document, 'label': 'Perubahan Data Peserta', 'color': const Color(0xFFFFF3E0), 'iconColor': const Color(0xFFE65100)},
      {'icon': Icons.headset_mic_outlined, 'label': 'Pengaduan Layanan JKN', 'color': const Color(0xFFE0F7FA), 'iconColor': const Color(0xFF00838F)},
      {'icon': Icons.dashboard_outlined, 'label': 'Menu Lainnya', 'color': const Color(0xFFE3F2FD), 'iconColor': const Color(0xFF1565C0)},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 4,
        childAspectRatio: 0.75,
        children: menuItems.map((item) => _buildMenuItem(item)).toList(),
      ),
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        print('Menu ${item['label']} ditekan');
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.blue.withOpacity(0.2),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: item['color'] as Color,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item['icon'] as IconData,
              color: item['iconColor'] as Color,
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item['label'] as String,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              height: 1.3,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJanjiLayanan() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'JANJI LAYANAN',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            'JAMINAN KESEHATAN NASIONAL (JKN)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(height: 2),
          Text(
            '(di Fasilitas Kesehatan Tingkat Pertama)',
            style: TextStyle(fontSize: 11, color: Color(0xFF00A99D)),
          ),
          SizedBox(height: 8),
          Text('1. Menerima NIK/KTP/NIK Digital untuk pendaftaran pelayanan', style: TextStyle(fontSize: 11)),
          Text('2. Tidak meminta dokumen fotokopi kepada Peserta', style: TextStyle(fontSize: 11)),
          Text('3. Memberikan pelayanan tanpa biaya tambahan', style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00A99D),
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedNavIndex,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      onTap: (index) {
        setState(() {
          _selectedNavIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Berita'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card_outlined), label: 'Kartu'),
        BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'FAQ'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}
