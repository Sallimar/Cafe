import 'package:flutter/material.dart';

void main() => runApp(CafeMenuApp());

class CafeMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe Menu',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8D6E63), // warna atas
                Color(0xFFE2B7A0), // warna bawah
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(child: MenuGrid()),
        ),
        appBar: AppBar(
  leading: IconButton(
    icon: Icon(Icons.chevron_left), // Ikon panah kembali
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
  title: Text(
    'Menu Cafe Hari Ini :)',
    style: TextStyle(color: Colors.white), // Set text color to white
  ),
  centerTitle: true,
  backgroundColor: Color(0xFF8D6E63), // warna background
  ),
  ),
  );
  }
}

class MenuGrid extends StatelessWidget {
  final List<Map<String, dynamic>> menus = [
    {
      'title': 'Coffe latte',
      'rating': 4.8,
      'time': '10 mnt',
      'price': '15k',
      'sellerName': 'Caffe The Tea',
      'sellerImage': 'https://th.bing.com/th/id/OIP.TT5TSVN5k35B9gECtaG3rwHaHa?w=183&h=192&c=7&r=0&o=5&pid=1.7',
      'image': 'https://brookrest.com/wp-content/uploads/2020/05/AdobeStock_315919556-scaled.jpeg'
    },
    {
      'title': 'Oat Milk',
      'rating': 4.7,
      'time': '10 mnt',
      'price': '15k',
      'sellerName': 'Caffe The Tea',
      'sellerImage': 'https://th.bing.com/th/id/OIP.TT5TSVN5k35B9gECtaG3rwHaHa?w=183&h=192&c=7&r=0&o=5&pid=1.7',
      'image': 'https://th.bing.com/th/id/OIP.-EU_bEsnZAU-Yg1UqX16hwHaJ4?rs=1&pid=ImgDetMain'
    },
    {
      'title': 'Ice Boba',
      'rating': 4.8,
      'time': '10 mnt',
      'price': '15k',
      'sellerName': 'Caffe The Tea',
      'sellerImage': 'https://th.bing.com/th/id/OIP.TT5TSVN5k35B9gECtaG3rwHaHa?w=183&h=192&c=7&r=0&o=5&pid=1.7',
      'image': 'https://th.bing.com/th/id/OIP.G6EyYO-f5s8I9PI_13Jc7wHaJQ?rs=1&pid=ImgDetMain'
    },
    {
      'title': 'Dalgona Coffe',
      'rating': 4.8,
      'time': '15 mnt',
      'price': '15k',
      'sellerName': 'Caffe The Tea',
      'sellerImage': 'https://th.bing.com/th/id/OIP.TT5TSVN5k35B9gECtaG3rwHaHa?w=183&h=192&c=7&r=0&o=5&pid=1.7',
      'image': 'https://th.bing.com/th/id/OIP.8CPqY94xSQX8vm7qVhHDqgHaLH?rs=1&pid=ImgDetMain'
    }
  ];

  Widget _buildRecipeCard({
    required String title,
    required double rating,
    required String time,
    required String price,
    required String sellerName,
    required String sellerImage,
    required bool isVerified,
    required Widget child,
  }) {
    return Card(
      elevation: 4.0,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(sellerImage),
                    radius: 12,
                  ),
                  SizedBox(width: 4),
                  Text(
                    sellerName,
                    style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                  if (isVerified) ...[
                    SizedBox(width: 3),
                    Icon(Icons.verified, color: Colors.blue, size: 16),
                  ],
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 145,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: child,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 14),
                    Icon(Icons.star, color: Colors.orange, size: 17),
                    SizedBox(width: 4),
                    Text(rating.toString(), style: TextStyle(fontSize: 17.0)),
                    SizedBox(width: 15),
                    Icon(Icons.access_time, size: 17),
                    SizedBox(width: 4),
                    Text(time, style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Icon(Icons.price_change, size: 17),
                      SizedBox(width: 4),
                      Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 75),
                      Icon(Icons.bookmark_border, size: 19),
                    ],
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.6,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        final menu = menus[index];
        return _buildRecipeCard(
          title: menu['title'],
          rating: menu['rating'],
          time: menu['time'],
          price: menu['price'],
          sellerName: menu['sellerName'],
          sellerImage: menu['sellerImage'],
          isVerified: true,
          child: Image.network(
            menu['image'],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                child: Center(child: Text('Gambar Tidak Tersedia')),
              );
            },
          ),
        );
      },
    );
  }
}
