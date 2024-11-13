import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat(max: 1);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.network(
            //   'https://codelessly.com/icons/codelessly_logo.png',
            //   width: 100,
            //   height: 100,
            // ),
            SizedBox(height: 20),
            Text(
              'Codelessly',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return LinearProgressIndicator(
                    minHeight: 25, borderRadius: BorderRadius.circular(15),
                    value: _controller
                        .value, // This will update as the animation progresses
                    backgroundColor: Colors.grey[200],
                    // color: Colors.blueAccent,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loading, please wait...',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
