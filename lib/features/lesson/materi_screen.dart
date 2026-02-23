import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class MateriScreen extends StatelessWidget {
  const MateriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Level Journey',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          children: [
            _buildLevelNode(1, 'Dasar 1', AppColors.emeraldGradient, true),
            _buildPathLine(AppColors.emeraldGradient[1]),
            _buildLevelNode(
              2,
              'Salam & Sapa',
              AppColors.blueGradient,
              false,
              isCurrent: true,
            ),
            _buildPathLine(Colors.grey[300]!),
            _buildLevelNode(
              3,
              'Angka',
              AppColors.purpleGradient,
              false,
              isLocked: true,
            ),
            _buildPathLine(Colors.grey[300]!),
            _buildLevelNode(
              4,
              'Keluarga',
              AppColors.orangeGradient,
              false,
              isLocked: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelNode(
    int level,
    String title,
    List<Color> gradient,
    bool isDone, {
    bool isCurrent = false,
    bool isLocked = false,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (isCurrent)
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.8, end: 1.2),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: gradient[0].withOpacity(0.3),
                      ),
                    ),
                  );
                },
              ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isLocked ? null : LinearGradient(colors: gradient),
                color: isLocked ? Colors.grey[200] : null,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Icon(
                isDone
                    ? Icons.check
                    : (isLocked ? Icons.lock : Icons.play_arrow),
                color: isLocked ? Colors.grey[400] : Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isLocked ? Colors.grey : AppColors.indigo900,
            fontSize: 16,
          ),
        ),
        Text(
          'Level $level',
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPathLine(Color color) {
    return Container(
      width: 4,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
