import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});


  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if( MediaQuery.of(context).size.height > 500 ) {
      isLarge = true;
    }else {
      isLarge = false;
    }

    final children = [
      const Expanded(child: MySlideSow()),
      const Expanded(child: MySlideSow()),
    ];

    return Scaffold(
      body: isLarge ? Column(children: children,) : Row(children: children,),
    );
  }
}

class MySlideSow extends StatelessWidget {
  const MySlideSow({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Slideshow(
      dotTop: true,
      sizeDot: 20,
      colorPrimary: appTheme.darkTheme ? appTheme.currentTheme.indicatorColor : Colors.pink,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
