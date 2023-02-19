import 'package:flutter/material.dart';

class Screen404 extends StatefulWidget {
  const Screen404({super.key});

  @override
  State<Screen404> createState() => _Screen404State();
}

class _Screen404State extends State<Screen404> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error 404'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Error inesperado'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
