import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/home_screen.dart';
import 'features/lesson/materi_screen.dart';
import 'core/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: BahasaKitaApp(),
    ),
  );
}

class BahasaKitaApp extends StatelessWidget {
  const BahasaKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'BahasaKita',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.indigo700,
            scaffoldBackgroundColor: AppColors.background,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),
            useMaterial3: true,
          ),
          home: const MainNavigationHandler(),
        );
      },
    );
  }
}

class MainNavigationHandler extends StatefulWidget {
  const MainNavigationHandler({super.key});

  @override
  State<MainNavigationHandler> createState() => _MainNavigationHandlerState();
}

class _MainNavigationHandlerState extends State<MainNavigationHandler> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const HomeScreen(),
    const MateriScreen(),
    const Center(child: Text('AI Assistant (Coming Soon)')),
    const Center(child: Text('Profil (Coming Soon)')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.indigo700,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), activeIcon: Icon(Icons.book), label: 'Materi'),
          BottomNavigationBarItem(icon: Icon(Icons.psychology_outlined), activeIcon: Icon(Icons.psychology), label: 'AI'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
