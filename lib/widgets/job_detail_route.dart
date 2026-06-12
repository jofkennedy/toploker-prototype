import 'package:flutter/material.dart';
import '../models/job.dart';
import '../screens/job_detail_screen.dart';

class JobDetailRoute extends PageRouteBuilder {
  final Job job;
  final Function(String) onSaveToggle;
  final Function(String) onApply;

  JobDetailRoute({
    required this.job,
    required this.onSaveToggle,
    required this.onApply,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => JobDetailScreen(
            job: job,
            onSaveToggle: onSaveToggle,
            onApply: onApply,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0.0, 0.08),
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
          transitionDuration: const Duration(milliseconds: 320),
        );
}
