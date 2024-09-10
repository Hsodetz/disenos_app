import 'package:disenos_app/src/routes/routes.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disenos en Flutter - Telefono'),
      ),
      drawer: const _MenuPrincipal(),
      body: const _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: currentTheme.indicatorColor,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: currentTheme.indicatorColor,),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: currentTheme.indicatorColor,),
        onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => pageRoutes[index].page,)),
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.indicatorColor,
                  child: const Text('HS', style: TextStyle(fontSize: 50),),
                ),
              ),
            ),

            const Expanded(child: _OptionsList()),

            ListTile(
              leading: Icon(Icons.lightbulb_circle_outlined, color: appTheme.currentTheme.indicatorColor,),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: appTheme.currentTheme.indicatorColor,
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
              ),
            ),

            SafeArea(
              bottom: true,
              left: false,
              right: false,
              top: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen_outlined, color: appTheme.currentTheme.indicatorColor,),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: appTheme.currentTheme.indicatorColor,
                  value: appTheme.customTheme,
                  onChanged: (value) => appTheme.customTheme = value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}