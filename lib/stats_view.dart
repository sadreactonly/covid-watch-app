import 'package:flutter/material.dart';

class StatsView extends StatefulWidget {
  final Future<String> future;
  final String title;

  const StatsView(this.title, this.future, {Key? key}) : super(key: key);

  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: widget.future,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                Text('${snapshot.data}', style: const TextStyle(fontSize: 50))
              ],
            ));
          }
        }
      },
    );
  }
}
