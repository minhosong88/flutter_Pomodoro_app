import 'package:flutter/material.dart';

class TimerSetting extends StatefulWidget {
  const TimerSetting({super.key});

  @override
  State<TimerSetting> createState() => _TimerSettingState();
}

class _TimerSettingState extends State<TimerSetting> {
  final TextEditingController _minutesController = TextEditingController();
  final TextEditingController _secondsController = TextEditingController();

  void _saveSetting() {
    String timeMinutes = _minutesController.text;
    String timeSeconds = _secondsController.text;
    int durationMin = int.tryParse(timeMinutes) ?? 0;
    int durationSec = int.tryParse(timeSeconds) ?? 0;
    // Convert minutes to seconds
    int totalSeconds = (durationMin * 60) + durationSec;
    // Pass the totalSeconds back to HomeScreen
    Navigator.pop(context, totalSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timer Setting',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.displayLarge!.color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Set Your Focus Time in Minutes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).cardColor,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _minutesController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                      labelText: 'Minutes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Min",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _secondsController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.w600),
                    decoration: const InputDecoration(
                      labelText: 'Seconds',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Sec",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            IconButton(
              onPressed: _saveSetting,
              icon: Icon(
                size: 50,
                Icons.save_rounded,
                color: Theme.of(context).textTheme.displayLarge!.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
