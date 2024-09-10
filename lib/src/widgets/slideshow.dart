import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotTop;
  final Color colorPrimary;
  final Color colorSecondary;
  final double sizeDot;

  const Slideshow({
    super.key,
    required this.slides,
    this.dotTop = false,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey,
    this.sizeDot = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlidesShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlidesShowModel>(context).sizeDot = sizeDot;
              Provider.of<_SlidesShowModel>(context).colorPrimary = colorPrimary;
              Provider.of<_SlidesShowModel>(context).colorSecondary = colorSecondary;

              return Column(
                children: [
                  if (dotTop)
                    _Dots(numberOfSlides: slides.length),
                  Expanded(child: _Slides(slides: slides,)),
                  if (!dotTop)
                    _Dots(numberOfSlides: slides.length,),
                ],
              );
            }
          ),
        ),
      ),

    );
  }
}

class _Dots extends StatelessWidget {
  final int numberOfSlides;

  const _Dots({super.key,
    required this.numberOfSlides,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.pink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // Esta es una manera
        // children: [
        //   for (int i = 0; i < numberOfSlides; i++) _Dot(index: i),
        // ],
        // Esta es otra manera con una funcion generadora
        children: List.generate(numberOfSlides, (index) => _Dot(index: index,)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final slidesShowModel = Provider.of<_SlidesShowModel>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceIn,
      width: slidesShowModel.sizeDot,
      height: slidesShowModel.sizeDot,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (slidesShowModel.currentPage >= index - 0.5 && slidesShowModel.currentPage <  index + 0.5)
            ? slidesShowModel.colorPrimary
            : slidesShowModel.colorSecondary,
        shape: BoxShape.circle,
      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides({
    super.key,
    required this.slides
  });

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    // Me creo un listener para estar escuchando el cambio de la pagina
    pageController.addListener(() {
      print('pagina actual: ${pageController.page}');

      // Aqui actualizamos el provider SliderModel
      // le pasamos el numero actual de la pagina en la que estemos
      Provider.of<_SlidesShowModel>(context, listen: false).currentPage = pageController.page!;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(40),
      child: slide,
    );
  }
}

class _SlidesShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimary = Colors.blue;
  Color _colorSecondary = Colors.grey;
  double _sizeDot = 15;

  double get sizeDot => _sizeDot;
  double get currentPage => _currentPage;
  Color get colorPrimary => _colorPrimary;
  Color get colorSecondary => _colorSecondary;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  set colorSecondary(Color value) {
    _colorSecondary = value;
  }

  set colorPrimary(Color value) {
    _colorPrimary = value;
  }

  set sizeDot(double value) {
    _sizeDot = value;
  }
}