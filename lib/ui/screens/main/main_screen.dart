import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/home_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/notification_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/search_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://louisville.edu/enrollmentmanagement/images/person-icon/image',
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to cook today?',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: Text('soup'),
                    avatar: Icon(Icons.local_dining),
                    backgroundColor: Colors.teal[50],
                  ),
                  Chip(
                    label: Text('seafood'),
                    avatar: Icon(Icons.filter_sharp),
                    backgroundColor: Colors.teal[50],
                  ),
                  Chip(
                    label: Text('sushi'),
                    avatar: Icon(Icons.rice_bowl),
                    backgroundColor: Colors.teal[50],
                  ),
                  // Add more chips as needed
                ],
              ),
              SizedBox(height: 24),
              _buildSectionTitle(context, 'Live cooking', Icons.grid_view),
              _buildLiveCookingSection(),
              SizedBox(height: 24),
              _buildSectionTitle(context, 'Top Chef', null),
              _buildTopChefSection(),
              SizedBox(height: 24),
              _buildSectionTitle(context, 'Popular Recipes', null),
              _buildPopularRecipesSection(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {},
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ));
              },
              color: Colors.black,
            ),
            SizedBox(width: 40), // The dummy child for spacing
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return NotificationScreen();
                  },
                ));
              },
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ProfileScreen();
                  },
                ));
              },
              color: Colors.black,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, IconData? icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (icon != null)
          IconButton(
            icon: Icon(icon),
            onPressed: () {},
          ),
        if (icon == null)
          TextButton(
            onPressed: () {},
            child: Text(
              'view all',
              style: TextStyle(color: Colors.teal),
            ),
          ),
      ],
    );
  }

  Widget _buildLiveCookingSection() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildLiveCookingCard(
              'Devilled whitebait and calamari',
              'https://www.eatright.org/-/media/images/eatright-landing-pages/foodgroupslp_804x482.jpg?as=0&w=967&rev=d0d1ce321d944bbe82024fff81c938e7&hash=E6474C8EFC5BE5F0DA9C32D4A797D10D',
              756),
          _buildLiveCookingCard(
              'Barbecued chicken',
              'https://louisville.edu/enrollmentmanagement/images/person-icon/image',
              432),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildLiveCookingCard(String title, String imageUrl, int viewers) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          Image.network(
              'https://www.eatright.org/-/media/images/eatright-landing-pages/foodgroupslp_804x482.jpg?as=0&w=967&rev=d0d1ce321d944bbe82024fff81c938e7&hash=E6474C8EFC5BE5F0DA9C32D4A797D10D'),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.redAccent,
              child: Text(
                '$viewers live',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 8,
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopChefSection() {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTopChefCard('Antonio', 'Professional Chef',
              'https://louisville.edu/enrollmentmanagement/images/person-icon/image'),
          _buildTopChefCard('Santana', 'Pastry Chef',
              'https://louisville.edu/enrollmentmanagement/images/person-icon/image'),
          _buildTopChefCard('John S', 'Sous Chef',
              'https://louisville.edu/enrollmentmanagement/images/person-icon/image'),
          _buildTopChefCard('Miller', 'Executive Chef',
              'https://louisville.edu/enrollmentmanagement/images/person-icon/image'),
          // Add more chef cards as needed
        ],
      ),
    );
  }

  Widget _buildTopChefCard(String name, String position, String imageUrl) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            position,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularRecipesSection() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildPopularRecipeCard('Sandwich with boiled egg',
            'https://www.eatright.org/-/media/images/eatright-landing-pages/planninglp_804x482.jpg?as=0&w=967&rev=f36ea2220e42486c9905276e4d3bb294&hash=80CF00DF4EC715E615053356B183D680'),
        _buildPopularRecipeCard('Fruity blueberry toast',
            'https://www.eatright.org/-/media/images/eatright-landing-pages/foodgroupslp_804x482.jpg?as=0&w=967&rev=d0d1ce321d944bbe82024fff81c938e7&hash=E6474C8EFC5BE5F0DA9C32D4A797D10D'),
        // Add more recipe cards as needed
      ],
    );
  }

  Widget _buildPopularRecipeCard(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black54,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
