import 'package:flutter/material.dart';

class TextInputCard extends StatelessWidget {
  const TextInputCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TextField(
              decoration: InputDecoration(
                labelText: 'Label',
                hintText: 'Hint',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.send),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
