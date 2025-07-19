import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About NTT Center'),
        backgroundColor: const Color(0xFFBF4F36),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About NTT Center Rajnandgaon',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBF4F36),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'NTT Center Rajnandgaon is Chhattisgarh\'s premier institution for Nursery Teacher Training, dedicated to preparing passionate individuals for careers in early childhood education.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              'Our Mission',
              'To provide comprehensive training and education to aspiring nursery teachers, equipping them with the skills, knowledge, and confidence needed to nurture young minds and contribute to the foundation of early childhood education.',
              Icons.track_changes,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Our Vision',
              'To be the leading center for nursery teacher training in Chhattisgarh, creating skilled professionals who will shape the future of early childhood education in the region.',
              Icons.visibility,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              'Why Choose Us?',
              '• Government Recognized Certification\n• Experienced and Qualified Faculty\n• Practical Training with Real Classroom Experience\n• Internship Opportunities\n• 100% Placement Assistance\n• Modern Teaching Methodologies\n• Comprehensive Curriculum',
              Icons.star,
            ),
            const SizedBox(height: 24),
            const Text(
              'Course Duration',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBF4F36),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The NTT course is typically of 1-2 years duration, designed to provide comprehensive training in child psychology, teaching methodologies, curriculum development, and practical classroom management.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              'Career Opportunities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBF4F36),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Nursery School Teacher\n• Pre-Primary Teacher\n• Early Childhood Educator\n• Child Care Center Manager\n• Educational Content Developer\n• Private Tutor for Young Children',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFFBF4F36), size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBF4F36),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(content, style: const TextStyle(fontSize: 14, height: 1.6)),
          ],
        ),
      ),
    );
  }
}
