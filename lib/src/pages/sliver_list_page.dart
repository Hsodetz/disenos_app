import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListTodo(),
      body: Stack(
        children: [
          _MainScroll(),

          const Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList()
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  const _ButtonNewList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ElevatedButton(
      
      onPressed: () => print('elevated buton'),
      style: ElevatedButton.styleFrom(
        backgroundColor: appTheme.darkTheme ? appTheme.currentTheme.indicatorColor : Colors.orange,
       minimumSize: Size(size.width * 0.90, size.height * 0.10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        ),
      ),
      child: Text('CREATE NEW LIST', style: TextStyle(color: appTheme.currentTheme.scaffoldBackgroundColor, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 3),)

    );
      
  }
}

class _MainScroll extends StatelessWidget {

 final items = [
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
  ];


  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return CustomScrollView(
      slivers: [

        // Esta es la manera de usar un sliver app bar, que reemplaza el appbar tradicional
        // const SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   title: Text('SliverAppBar'),
        //   backgroundColor: Colors.orange,
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 200,
            maxheight: 220,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              child: const _Title(),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 150,)
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child     != oldDelegate.child; 
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 20,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text('New', style: TextStyle(color: appTheme.darkTheme ? appTheme.currentTheme.indicatorColor : const Color(0xff532128), fontSize: 50),),
        ),

        Stack(
          children: [
            const SizedBox(width: 100,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: const Color(0xfff7cdd5),
              )
            ),

            Text('List', style: TextStyle(color: appTheme.darkTheme ? appTheme.currentTheme.indicatorColor : const Color(0xffd93a30,),fontSize: 50, fontWeight: FontWeight.bold),),
          ],
        )

      ],
    );
  }
}

class _ListTodo extends StatelessWidget {
  
  final items = [
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title: 'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title: 'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title: 'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title: 'Books', color: Color(0xffFCEBAF) ),
  ];
  
  _ListTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}


class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  
  const _ListItem({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appTheme.darkTheme ? appTheme.currentTheme.secondaryHeaderColor : color,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}
