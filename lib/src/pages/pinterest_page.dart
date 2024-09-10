import 'dart:math';

import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {

    final widthScreen = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: Scaffold(
        //body: PinterestMenu(),
        //body: PinterestGrid(),
        body: Stack(
          children: [
            const PinterestGrid(),
            Positioned(
              bottom: 40,
              left: widthScreen.width * 0.25,
              child: _PinterestMenu(),
            )
          ],
        ),
      ),
    );
  }
}

class _PinterestMenu extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;


    return PinterestMenu(
      show: show,
      activeColor: appTheme.darkTheme ? currentTheme.indicatorColor : Colors.red,
      inactiveColor: Colors.blueAccent,
      backgroundColor: currentTheme.scaffoldBackgroundColor,
      items: [
        PinterestButton(onPressed: () => print('Icon pieChart'), icon: Icons.pie_chart_outline),
        PinterestButton(onPressed: () => print('Icon search_outlined'), icon: Icons.search_outlined),
        PinterestButton(onPressed: () => print('Icon notifications_outlined'), icon: Icons.notifications_outlined),
        PinterestButton(onPressed: () => print('Icon supervised_user_circle_outlined'), icon: Icons.supervised_user_circle_outlined),
      ],
    );
  }
}

class PinterestGrid extends StatefulWidget {

  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<Map<String, dynamic>> _items = List.generate(
      200,
          (index) => {
        "id": index,
        "title": "Item $index",
        "height": Random().nextInt(150) + 50.5
      });
  final ScrollController controller = ScrollController();
  double scrollPreviousValue = 0;

  @override
  void initState() {
    controller.addListener(() {
      print(controller.offset);

      if (controller.offset > scrollPreviousValue && controller.offset > 150) {
        print('mostrar Menu');
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        print('ocultar menu');
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      scrollPreviousValue = controller.offset;

    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      physics: const BouncingScrollPhysics(),
      // the number of columns
      crossAxisCount: 2,
      // vertical gap between two items
      mainAxisSpacing: 3,
      // horizontal gap between two items
      crossAxisSpacing: 3,
      itemCount: _items.length,
      itemBuilder: (context, index) {

        return _PinterestItem(index: index);
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Este es el que da el efecto de como si estuviese desordenado!
      height: Random().nextInt(150) + 50.5,
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: CircleAvatar(
        radius: 1,
        backgroundColor: Colors.blue,
        child: Text(index.toString()),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}


