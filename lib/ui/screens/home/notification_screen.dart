import 'package:amaliyot_oxiringi_oy/ui/screens/home/home_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/home/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
              color: Colors.black,
            ),
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ));
              },
              color: Colors.black,
            ),
            const SizedBox(width: 40), // The dummy child for spacing
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
              color: Colors.black,
            ),
            IconButton(
              icon: const Icon(Icons.person_outline),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Notification',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.teal),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Recent'),
            _buildNotificationItem(
              'Fernandez',
              'loved your recipes',
              '23 mins ago',
              'https://via.placeholder.com/150',
              'https://via.placeholder.com/50',
            ),
            _buildNotificationItem(
              'Amanda',
              'has followed you back',
              '2 hours ago',
              'https://via.placeholder.com/50',
            ),
            _buildNotificationItem(
              'Michale',
              'reviewed your recipe: I\'ve tried it and it\'s delicious!',
              '4 hours ago',
              'https://via.placeholder.com/50',
              'https://via.placeholder.com/150',
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Older Notifications'),
            _buildNotificationItem(
              'Patricia',
              'has posted her new recipe',
              '1 day ago',
              'https://via.placeholder.com/50',
              'https://via.placeholder.com/150',
            ),
            _buildNotificationItem(
              'Fernandez',
              'has updated his recipe\'s gallery',
              '1 day ago',
              'https://via.placeholder.com/50',
              'https://via.placeholder.com/50',
            ),
            _buildNotificationItem(
              'Charles Walker',
              'is now following you',
              '2 days ago',
              'https://via.placeholder.com/50',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.teal,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
      String name, String action, String time, String profileUrl,
      [String? recipeUrl]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(profileUrl),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: '$name ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: action),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (recipeUrl != null) ...[
            const SizedBox(width: 8),
            Image.network(
              recipeUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ],
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.teal),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
