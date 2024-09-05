import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/food_select.dart';

class CountrySelectionScreen extends StatelessWidget {
  const CountrySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 6,
            ),
            BounceInLeft(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.teal,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ))
        ],
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Your preferred\ncountry food?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/al.png'),
                  title: const Text('Albania'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/us.png'),
                  title: const Text('United States'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/ca.png'),
                  title: const Text('Canada'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/uz.png'),
                  title: const Text('Uzbekistan'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/jp.png'),
                  title: const Text('Japan'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/br.png'),
                  title: const Text('Brazil'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/in.png'),
                  title: const Text('India'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/mx.png'),
                  title: const Text('Mexico'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/de.png'),
                  title: const Text('Germany'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/fr.png'),
                  title: const Text('France'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/cn.png'),
                  title: const Text('China'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/es.png'),
                  title: const Text('Spain'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/kr.png'),
                  title: const Text('South Korea'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/ru.png'),
                  title: const Text('Russia'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/it.png'),
                  title: const Text('Italy'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.network(
                      width: 42, 'https://flagcdn.com/w320/au.png'),
                  title: const Text('Australia'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FoodSelectionScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                minimumSize: const Size(315, 60),
                backgroundColor: const Color(0xff3FB4B1),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
