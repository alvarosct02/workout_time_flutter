import 'package:flutter/material.dart';

class CountDownScreen extends StatefulWidget {
  @override
  _CountDownScreenState createState() => _CountDownScreenState();
}

class _CountDownScreenState extends State<CountDownScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Push 10 x 10 Day",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline,
            ),
            Spacer(flex: 1),
            Text(
              "Time left",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
            ),
            Text(
              "00:00",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline.copyWith(
                    fontSize: 48,
                  ),
            ),
            Spacer(flex: 1),
            Text(
              "Exercises",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 16
                  ),
            ),
            SizedBox(height: 4),
            Text(
              "A. Barbell bench press",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              "B. Barbell bench press",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              "B. Barbell bench press",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 16),
            Text(
              "Round",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 16
                  ),
            ),
            SizedBox(height: 4),
            Text(
              "1 of 10",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.title,
            ),
            Spacer(flex: 1),
            _buildBottomButtons()
          ],
        ),
      ),
    );
  }

  _buildBottomButtons() {
    return Row(children: [
      FlatButton(
        color: Theme.of(context).disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
            height: 60,
            child: Center(
              child: Icon(
                Icons.close,
                size: 32,
              ),
            )),
        onPressed: () => {},
      ),
      SizedBox(width: 16),
      Expanded(
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
              height: 60,
              child: Center(
                child: Text("Siguiente", style: TextStyle(fontSize: 16)),
              )),
          onPressed: () => {},
        ),
      ),
    ]);
  }
}
