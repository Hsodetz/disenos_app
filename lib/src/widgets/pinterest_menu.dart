import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});

}

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  // final List<PinterestButton> items = [
  //   PinterestButton(onPressed: () => print('Icon pieChart'), icon: Icons.pie_chart_outline),
  //   PinterestButton(onPressed: () => print('Icon search_outlined'), icon: Icons.search_outlined),
  //   PinterestButton(onPressed: () => print('Icon notifications_outlined'), icon: Icons.notifications_outlined),
  //   PinterestButton(onPressed: () => print('Icon supervised_user_circle_outlined'), icon: Icons.supervised_user_circle_outlined),
  // ];

  const PinterestMenu({super.key,
    required this.show,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    //print(activeColor);
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: show ? 1 : 0,
        child: Builder(
          builder: (context) {

            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

            return _PinterestMenuBackground(
                child: _MenuItems(menuItems: items,)
            );
          }
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final backGroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          ),
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;
  const _MenuItems({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index: index, pinterestButton: menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton pinterestButton;

  const _PinterestMenuButton({super.key, required this.index, required this.pinterestButton});

  @override
  Widget build(BuildContext context) {

    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;
    final menuModelProvider = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        pinterestButton.onPressed;
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          pinterestButton.icon,
          size: itemSelected == index ? 35 : 25,
          color: itemSelected == index ? menuModelProvider.activeColor : menuModelProvider.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  Color get backgroundColor => _backgroundColor;
  Color get activeColor => _activeColor;
  Color get inactiveColor => _inactiveColor;
  int get itemSelected => _itemSelected;

  set backgroundColor(Color value) {
    _backgroundColor = value;
  }
  set inactiveColor(Color value) {
    _inactiveColor = value;
  }

  set activeColor(Color value) {
    _activeColor = value;
  }

  set itemSelected(int value) {
    _itemSelected = value;
    notifyListeners();
  }
}


