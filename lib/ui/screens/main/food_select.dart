import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:amaliyot_oxiringi_oy/ui/screens/main/main_screen.dart';

class FoodSelectionScreen extends StatelessWidget {
  const FoodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BounceInLeft(
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
        ),
        actions: [TextButton(onPressed: () {}, child: const Text('Skip'))],
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Any\nDislikes?',
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Image.asset('assets/images/nood.png'),
                )
                // Add other food items similarly...
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(),
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
