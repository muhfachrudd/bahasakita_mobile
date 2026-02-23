import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/app_colors.dart';
import '../../shared/widgets/custom_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Pattern (Placeholder for union.svg)
          Positioned(
            top: -50,
            right: -50,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: AppColors.indigo200.withOpacity(0.3),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 24.h),
                  Text(
                    'Progres Belajar Anda',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.indigo900,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  _buildStatsGrid(),
                  SizedBox(height: 24.h),
                  _buildLessonCard(),
                  SizedBox(height: 24.h),
                  _buildRecentAchievement(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, Pembelajar!',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.indigo700,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Ayo lanjut belajar!',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.indigo900,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.indigo700,
          child: Icon(LucideIcons.user, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1,
      crossAxisSpacing: 12.w,
      children: [
        _buildStatItem('Total XP', '2450', LucideIcons.star, AppColors.yellow500),
        _buildStatItem('Lessons', '32/120', LucideIcons.bookOpen, AppColors.indigo700),
        _buildStatItem('Streak', '5 hari', LucideIcons.flame, AppColors.orange500),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24.sp),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.indigo900,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: AppColors.blueGradient),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.indigo700.withOpacity(0.3),
            offset: const Offset(0, 8),
            blurRadius: 15,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Lanjut Belajar:',
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Unit 3',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Bahasa Jawa Dasar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: 'Mulai Latihan',
            color: AppColors.yellow500,
            onPressed: () {},
            height: 48, // Error here, height wasn't in CustomButton, let me fix CustomButton first
          ),
        ],
      ),
    );
  }

  Widget _buildRecentAchievement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pencapaian Terbaru',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.indigo900,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Lihat Semua'),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.yellow500.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(LucideIcons.trophy, color: AppColors.yellow500, size: 30.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengejar Bintang',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.indigo900,
                      ),
                    ),
                    Text(
                      'Raih 500 XP dalam satu hari',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  }
