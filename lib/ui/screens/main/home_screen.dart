import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amaliyot_oxiringi_oy/logic/blocs/auth/auth_bloc.dart';
import 'package:amaliyot_oxiringi_oy/logic/blocs/auth/auth_state.dart';
import 'package:amaliyot_oxiringi_oy/logic/services/auth_service.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/auth/login_screen.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authService = AuthService();
  String? username;
  String? photo;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final data = await authService.getCurrentUser();

    setState(() {
      username = data['data']['name'];
      photo = data['data']['photo'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else if (state is AuthLoading) {
          showDialog(
              context: context,
              builder: (ctx) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://your-background-image-url.com', // Replace with actual background image URL
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => EditProfileScreen(),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.settings, color: Colors.white),
                              onPressed: () {
                                // Navigate to settings or other screen
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -60,
                    left: MediaQuery.of(context).size.width / 2 - 60,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        photo == null
                            ? "https://i.pinimg.com/originals/62/bc/41/62bc418b4e75637360ad6d0a22bd2465.png"
                            : 'http://recipe.flutterwithakmaljon.uz/storage/avatars/$photo',
                      ),
                      onBackgroundImageError: (error, stackTrace) {
                        // Error handling for loading image
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              Text(
                username ?? 'Loading...',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "San Francisco, CA",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn('23', 'Recipes'),
                  _buildStatColumn('431', 'Following'),
                  _buildStatColumn('1.4k', 'Followers'),
                ],
              ),
              SizedBox(height: 16),
              _buildCategoryTabs(),
              SizedBox(height: 16),
              _buildRecipeGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryTab('Food Recipes', Icons.restaurant_menu, true),
          _buildCategoryTab('Cookbook', Icons.book, false),
          _buildCategoryTab('Live', Icons.videocam, false),
          // Add more tabs if needed
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, IconData icon, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.teal[50],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.teal),
            SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildRecipeCard(
            'Grilled meat and veggies',
            'https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200',
            '31 min'),
        _buildRecipeCard(
            'Grilled meat and veggies',
            'https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200',
            '31 min'),
      ],
    );
  }

  Widget _buildRecipeCard(String title, String imageUrl, String time) {
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
            bottom: 16,
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
            bottom: 8,
            left: 8,
            child: Text(
              time,
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
