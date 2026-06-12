import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/colors.dart';
import '../widgets/scale_tap.dart';
import 'home_screen.dart';
import 'saved_screen.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late List<Job> _jobsList;
  
  // Login State
  bool _isLoggedIn = false;
  String _userEmail = '';
  String _userName = '';

  @override
  void initState() {
    super.initState();
    // Initialize mutable list with our mock jobs
    _jobsList = List.from(mockJobs);
  }

  void _toggleSaveJob(String id) {
    setState(() {
      final index = _jobsList.indexWhere((j) => j.id == id);
      if (index != -1) {
        final job = _jobsList[index];
        job.isSaved = !job.isSaved;

        // Show a brief snackbar feedback
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              job.isSaved 
                  ? 'Pekerjaan berhasil disimpan!' 
                  : 'Pekerjaan dihapus dari tersimpan.',
              style: const TextStyle(fontSize: 13),
            ),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.primary,
          ),
        );
      }
    });
  }

  void _applyJob(String id) {
    setState(() {
      final index = _jobsList.indexWhere((j) => j.id == id);
      if (index != -1) {
        _jobsList[index].isApplied = true;
      }
    });
  }

  void _goToHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen(
          jobs: _jobsList,
          onSaveToggle: _toggleSaveJob,
          onApply: _applyJob,
        );
      case 1:
        return SavedScreen(
          jobs: _jobsList,
          onSaveToggle: _toggleSaveJob,
          onApply: _applyJob,
          onGoToHome: _goToHome,
        );
      case 2:
        if (!_isLoggedIn) {
          return LoginScreen(
            onLoginSuccess: (email, name) {
              setState(() {
                _isLoggedIn = true;
                _userEmail = email;
                _userName = name;
              });
            },
          );
        }
        return ProfileScreen(
          jobs: _jobsList,
          onGoToHome: _goToHome,
          userName: _userName,
          userEmail: _userEmail,
          onLogout: () {
            setState(() {
              _isLoggedIn = false;
              _userEmail = '';
              _userName = '';
            });
          },
        );
      default:
        return HomeScreen(
          jobs: _jobsList,
          onSaveToggle: _toggleSaveJob,
          onApply: _applyJob,
        );
    }
  }

  Widget _buildDockItem(
    int index,
    IconData activeIcon,
    IconData inactiveIcon,
    String label,
  ) {
    final bool isActive = _currentIndex == index;
    return Expanded(
      child: ScaleTap(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        scaleDown: 0.97,
        child: Container(
          color: Colors.transparent,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Translate naik saat aktif
              AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                transform: Matrix4.translationValues(0, isActive ? -2.5 : 0, 0),
                child: AnimatedScale(
                  scale: isActive ? 1.15 : 1.0,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    child: TweenAnimationBuilder<Color?>(
                      duration: const Duration(milliseconds: 300),
                      tween: ColorTween(
                        begin: Colors.grey.shade400,
                        end: isActive ? Colors.white : Colors.grey.shade400,
                      ),
                      builder: (context, color, child) {
                        return Icon(
                          isActive ? activeIcon : inactiveIcon,
                          color: color,
                          size: 24,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                  color: isActive
                      ? Colors.white
                      : Colors.grey.shade400,
                  letterSpacing: isActive ? 0.2 : 0.0,
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 320),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.025),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ));
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: slideAnimation,
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: _buildBody(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.08),
                blurRadius: 24,
                spreadRadius: 0,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Sliding active indicator
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 420),
                      curve: Curves.easeOutQuint,
                      alignment: Alignment(
                        _currentIndex == 0
                            ? -0.92
                            : (_currentIndex == 1 ? 0.0 : 0.92),
                        0.0,
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.28,
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.secondary,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.35),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Glass reflection highlight
                              Positioned(
                                top: 2,
                                left: 4,
                                right: 4,
                                height: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(14),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withValues(alpha: 0.2),
                                        Colors.white.withValues(alpha: 0.0),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                              // Active liquid orange dot
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 12,
                                  height: 3,
                                  margin: const EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.accent,
                                    borderRadius: BorderRadius.circular(1.5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.accent,
                                        blurRadius: 4,
                                        spreadRadius: 0.5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Tab items
                    Positioned.fill(
                      child: Row(
                        children: [
                          _buildDockItem(0, Icons.home_rounded, Icons.home_outlined, 'Beranda'),
                          _buildDockItem(1, Icons.bookmark_rounded, Icons.bookmark_outline, 'Tersimpan'),
                          _buildDockItem(2, Icons.person_rounded, Icons.person_outlined, 'Profil'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
