import 'package:appbar_tabbar/dafaults/defaults.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

int indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String text = 'Clicked';
  final page = [
    Center(
      child: Text('Inbox'),
    ),
    Center(
      child: Text('Starred'),
    ),
    Center(
      child: Text('Sent'),
    ),
    Center(
      child: Text('Drafts'),
    ),
    Center(
      child: Text('Trash'),
    ),
    Center(
      child: Text('Spam'),
    ),
  ];
  VoidCallback updateState(int index) {
    return () {
      setState(() {
        index = indexClicked;
      });
      Navigator.pop(context);
    };
  }

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        endDrawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/drawer.jpg'),
                  ),
                ),
                padding: EdgeInsets.all(0),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Johnrambo',
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Johnrambo@gmail.com',
                        style: GoogleFonts.lato(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    AppListTile(
                      index: 0,
                      ontap: updateState(0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppListTile(
                      index: 1,
                      ontap: updateState(1),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppListTile(
                      index: 2,
                      ontap: updateState(2),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppListTile(
                      index: 3,
                      ontap: updateState(3),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppListTile(
                      index: 4,
                      ontap: updateState(4),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppListTile(
                      index: 5,
                      ontap: updateState(5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        key: drawerKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.car_repair,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home_repair_service,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.room_service,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              splashRadius: 30,
              icon: Icon(Icons.cast),
              onPressed: () {
                setState(
                  () {
                    text = 'Casting Clicked';
                  },
                );
              },
            ),
            IconButton(
              splashRadius: 30,
              icon: Icon(Icons.notifications),
              onPressed: () {
                setState(
                  () {
                    text = 'Notification Clicked';
                  },
                );
              },
            ),
            IconButton(
              splashRadius: 30,
              icon: Icon(Icons.search),
              onPressed: () {
                setState(
                  () {
                    text = 'Search Clicked';
                  },
                );
              },
            ),
            IconButton(
              splashRadius: 30,
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              onPressed: () {
                setState(
                  () {
                    drawerKey.currentState?.openEndDrawer();
                  },
                );
              },
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage('assets/images/logo.png')),
          ),
          title: Text('Flutter'),
          backgroundColor: Colors.deepOrange[400],
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                'Car repair - $text',
              ),
            ),
            Center(
              child: Text(
                'Home repair - $text',
              ),
            ),
            Center(
              child: Text(
                'Room service - $text',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppListTile extends StatelessWidget {
  const AppListTile({required this.index, required this.ontap});
  final int index;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      selected: indexClicked == index,
      selectedTileColor: Defaults.drawerSelectedTileColor,
      leading: Icon(
        Defaults.drawerItemIcon[index],
        size: 30,
        color: indexClicked == index
            ? Defaults.drawerItemSelectedColor
            : Defaults.drawerItemColor,
      ),
      title: Text(
        Defaults.drawerItemText[index],
        style: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
      ),
    );
  }
}
