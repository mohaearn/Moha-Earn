import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moha Earn',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MohaHome(),
    );
  }
}

class MohaHome extends StatefulWidget {
  @override
  _MohaHomeState createState() => _MohaHomeState();
}

class _MohaHomeState extends State<MohaHome> {
  int points = 0;
  int index = 0;

  addPoints(int p) {
    setState(() => points += p);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('+$p Points! Total: $points')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Moha Earn - $points Pts'),
          backgroundColor: Colors.green),
      body: index == 0
          ? tasksPage()
          : index == 1
              ? spinPage()
              : profilePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.casino), label: 'Spin'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget tasksPage() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        taskCard('Daily Check-in', 10, Icons.check_circle),
        taskCard('Watch Ad', 20, Icons.play_circle),
        taskCard('Invite Friend', 50, Icons.share),
        taskCard('Follow TikTok', 30, Icons.music_note),
        SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, padding: EdgeInsets.all(16)),
            onPressed: () {},
            child: Text('WITHDRAW - 1000 Pts = 100 KSH',
                style: TextStyle(color: Colors.white, fontSize: 16)))
      ],
    );
  }

  Widget taskCard(String title, int reward, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 40),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('+$reward Points'),
        trailing: ElevatedButton(
            onPressed: () => addPoints(reward), child: Text('DO')),
      ),
    );
  }

  Widget spinPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.casino, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text('Spin & Win!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16)),
              onPressed: () {
                var rewards = [5, 10, 15, 20, 50];
                rewards.shuffle();
                addPoints(rewards.first);
              },
              child: Text('SPIN NOW', style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }

  Widget profilePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 10),
          Text('Moha User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('$points',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
          Text('Total Points'),
          SizedBox(height: 20),
          Text('1000 Pts = 100 KSH',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('M-Pesa Withdraw', style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
