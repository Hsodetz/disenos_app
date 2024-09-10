import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/pages/launcher_page.dart';
import 'package:disenos_app/src/pages/launcher_tablet_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//       // Nota: Este valor (numero dentro de ThemeChanger()) lo podemos guardar en las preferencias de usuario
//       // y cuando se cargue la app se colocara en modo oscuro, claro, o tema predeterminado
//       create: (_) => ThemeChanger(3),
//       child: const MyApp(),
//     ),
//   );
// }

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeChanger>(create: (context) => ThemeChanger(3),),
          ChangeNotifierProvider<LayoutModel>(create: (context) => LayoutModel(),),
        ],
      child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.currentTheme,
      title: 'Disenos App',
      home: OrientationBuilder(
        builder: (context, orientation) {
          print('orientation: $orientation');

          final screenSize = MediaQuery.of(context).size;

          // Si tengo mas de 500px de ancho entonces podria trabajar modo tableta
          if(screenSize.width > 500) {
            return const LauncherTabletPage();
          } else{
            return const LauncherPage();

          }

        },
      ),
    );
  }
}

