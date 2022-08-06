import 'package:flutter/material.dart';
import 'package:newsapp/core/provider/theme_provider.dart';
import 'package:newsapp/ui/widgets/verical_spacing.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: Material(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  const VericalSpacing(20),
                  const Flexible(child: Text('News App'))
                ],
              ),
            ),
            const VericalSpacing(20),
            DrawerList(
              labels: 'Home',
              icon: Icons.home,
              onTap: () {},
            ),
            DrawerList(
              labels: 'Bookmarks',
              icon: Icons.bookmark,
              onTap: () {},
            ),
            const Divider(
              thickness: 3,
            ),
            SwitchListTile(
              title: Text(
                themeProvider.getDartTheme ? 'Dark' : 'Light',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              secondary: Icon(
                themeProvider.getDartTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDartTheme,
              onChanged: (value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final String labels;
  final Function onTap;
  final IconData icon;
  const DrawerList(
      {Key? key, required this.labels, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        labels,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
