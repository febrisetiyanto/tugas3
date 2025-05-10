import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variabel untuk melacak warna latar belakang
  Color _backgroundColor = Colors.blueGrey[50]!;
  bool _isDarkMode = false; // Menambahkan variabel untuk dark mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor, // Background berubah sesuai pilihan
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Lapak Kita",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildCategoryItem("All"),
                    _buildCategoryItem("T-shirt"),
                    _buildCategoryItem("Shirt"),
                    _buildCategoryItem("Hoodie"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              makeItem(image: 'assets/images/jeans3.jpeg', tag: 'jeans3'),
              makeItem(image: 'assets/images/jeans.jpg', tag: 'jeans1'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextButton(
            onPressed: () {
              setState(() {
                if (_isDarkMode) {
                  _backgroundColor = Colors.blueGrey[50]!;
                  _isDarkMode = false;
                } else {
                  _backgroundColor = Colors.black;
                  _isDarkMode = true;
                }
              });
            },
            child: Text(
              _isDarkMode ? 'Light Mode' : 'Dark Mode',
              style: TextStyle(
                color: _isDarkMode ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 2.2 / 1,
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(200),
          ),
          child: Center(
            child: Text(title, style: const TextStyle(fontSize: 17)),
          ),
        ),
      ),
    );
  }

  Widget makeItem({required String image, required String tag}) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Jeans",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black54, blurRadius: 5)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
