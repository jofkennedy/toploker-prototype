import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/colors.dart';
import '../widgets/animated_list_item.dart';
import '../widgets/job_detail_route.dart';
import '../widgets/job_list_item_card.dart';

class SavedScreen extends StatelessWidget {
  final List<Job> jobs;
  final Function(String) onSaveToggle;
  final Function(String) onApply;
  final Function() onGoToHome;

  const SavedScreen({
    super.key,
    required this.jobs,
    required this.onSaveToggle,
    required this.onApply,
    required this.onGoToHome,
  });

  List<Job> get _savedJobs {
    return jobs.where((job) => job.isSaved).toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = _savedJobs;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Pekerjaan Tersimpan',
          style: TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: list.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: AppColors.primarySoft,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.bookmark_outline_rounded,
                        color: AppColors.primary,
                        size: 64,
                      ),
                      
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Belum Ada Pekerjaan Disimpan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cari dan simpan lowongan pekerjaan yang menarik minat Anda untuk dilamar di kemudian hari.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textDark.withValues(alpha: 0.5),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        onPressed: onGoToHome,
                        child: const Text(
                          'Cari Lowongan Kerja',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.fromLTRB(
                20, 20, 20,
                MediaQuery.of(context).padding.bottom + 116,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final job = list[index];
                return AnimatedListItem(
                  index: index,
                  child: JobListItemCard(
                    job: job,
                    onTap: () {
                      Navigator.push(
                        context,
                        JobDetailRoute(
                          job: job,
                          onSaveToggle: onSaveToggle,
                          onApply: onApply,
                        ),
                      );
                    },
                    onSaveToggle: () => onSaveToggle(job.id),
                  ),
                );
              },
            ),
    );
  }
}
