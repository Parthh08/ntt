import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SeedsToShineApp());
}

class SeedsToShineApp extends StatelessWidget {
  const SeedsToShineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seeds to Shine Academy - NTT Coaching Classes',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // Deep green from logo
          secondary: const Color(0xFFFF8F00), // Orange from logo
        ),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            shadowColor: Colors.green.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      home: const SeedsToShineHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SeedsToShineHomePage extends StatefulWidget {
  const SeedsToShineHomePage({super.key});

  @override
  State<SeedsToShineHomePage> createState() => _SeedsToShineHomePageState();
}

class _SeedsToShineHomePageState extends State<SeedsToShineHomePage>
    with TickerProviderStateMixin {
  static const String phoneNumber = '7000217171';
  static const String emailAddress = 'seedtoshineNTT@gmail.com';
  static const String address = 'Rajnandgaon, Chhattisgarh, India';
  static const double latitude = 21.0972;
  static const double longitude = 81.0364;

  late AnimationController _heroController;
  late AnimationController _fabController;
  late Animation<double> _heroAnimation;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _fabController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _heroAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _heroController, curve: Curves.easeInOut),
    );
    _fabAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fabController, curve: Curves.elasticOut),
    );

    _heroController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _fabController.forward();
    });
  }

  @override
  void dispose() {
    _heroController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: CustomScrollView(
          slivers: [
            // Animated App Bar
            SliverAppBar(
              expandedHeight: 350,
              floating: false,
              pinned: true,
              backgroundColor: const Color(0xFF2E7D32), // Deep green from logo
              flexibleSpace: FlexibleSpaceBar(
                title: FadeInUp(
                  delay: const Duration(milliseconds: 600),
                  child: Text(
                    'SEEDS TO SHINE ACADEMY',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF2E7D32), // Deep green
                        Color(0xFF4CAF50), // Medium green
                        Color(0xFF66BB6A), // Light green
                      ],
                    ),
                  ),
                  child: AnimatedBuilder(
                    animation: _heroAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _heroAnimation.value,
                        child: Opacity(
                          opacity: _heroAnimation.value,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 50),
                                // Logo placeholder (you can add the actual logo image here)
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.local_florist,
                                    size: 40,
                                    color: Color(0xFF2E7D32),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                // Animated title
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      'SEEDS TO SHINE',
                                      textStyle: GoogleFonts.poppins(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          const Shadow(
                                            offset: Offset(2, 2),
                                            blurRadius: 4,
                                            color: Colors.black26,
                                          ),
                                        ],
                                      ),
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                ),
                                const SizedBox(height: 12),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 2000),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFFFF8F00,
                                      ), // Orange from logo
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'NTT COACHING CLASSES',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Main content
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),

                // Hero Section
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.white,
                          Color(0xFFF1F8E9),
                        ], // Light green tint
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SlideInDown(
                          delay: const Duration(milliseconds: 500),
                          child: Text(
                            '🌱 Where Seeds of Knowledge Grow into Bright Futures 🌟',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2E7D32), // Deep green
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeInUp(
                          delay: const Duration(milliseconds: 700),
                          child: Text(
                            'Are you passionate about teaching and early childhood education?',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SlideInUp(
                          delay: const Duration(milliseconds: 900),
                          child: Text(
                            'Here\'s your chance to build a bright career in pre-primary teaching!',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Course Features
                Pulse(
                  delay: const Duration(milliseconds: 1100),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF2E7D32),
                              Color(0xFF4CAF50),
                            ], // Green gradient
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          children: [
                            FadeInDown(
                              delay: const Duration(milliseconds: 1300),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  '🌟 Join Seeds to Shine Academy 🌟\nNTT (Nursery Teacher Training) Course\nAdmissions Open!',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    height: 1.3,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            ...List.generate(4, (index) {
                              final features = [
                                '🎓 Government Recognized Certification',
                                '👩‍🏫 Experienced & Caring Faculty',
                                '🤝 Practical Training + Internship Support',
                                '🚀 100% Placement Assistance',
                              ];
                              final icons = [
                                FontAwesomeIcons.seedling, // Growth theme
                                FontAwesomeIcons.users, // Community theme
                                FontAwesomeIcons.handshake,
                                FontAwesomeIcons.trophy, // Success theme
                              ];

                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    delay: Duration(
                                      milliseconds: 1500 + (index * 300),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            spreadRadius: 0,
                                            blurRadius: 10,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 0,
                                                  blurRadius: 8,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: FaIcon(
                                              icons[index],
                                              color: const Color(
                                                0xFF2E7D32,
                                              ), // Deep green
                                              size: 24,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Text(
                                              features[index],
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                height: 1.3,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Call to Action
                FadeInUp(
                  delay: const Duration(milliseconds: 2500),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFF8F00),
                          Color(0xFFFFB74D),
                        ], // Orange gradient from logo
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF8F00).withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '� Plant the Seeds of Your Teaching Career Today! 🌟\nGrow with Seeds to Shine Academy!',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Bounce(
                          delay: const Duration(milliseconds: 3000),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildActionButton(
                                  'Call Now',
                                  FontAwesomeIcons.phone,
                                  () => _makePhoneCall(),
                                  Colors.white,
                                  const Color(0xFF2E7D32), // Deep green
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildActionButton(
                                  'Get Info',
                                  FontAwesomeIcons.circleInfo,
                                  () => _showContactForm(context),
                                  const Color(0xFF2E7D32), // Deep green
                                  Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Contact Section
                _buildContactSection(),

                const SizedBox(height: 120), // Space for FAB
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _fabAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _fabAnimation.value,
            child: Transform.rotate(
              angle: _fabAnimation.value * 2 * 3.14159,
              child: FloatingActionButton.extended(
                onPressed: () => _makePhoneCall(),
                icon: const FaIcon(FontAwesomeIcons.phone, size: 20),
                label: Text(
                  'Quick Call',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                backgroundColor: const Color(0xFF2E7D32), // Deep green
                foregroundColor: Colors.white,
                elevation: 15,
                heroTag: "quick_call",
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    VoidCallback onPressed,
    Color backgroundColor,
    Color textColor,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(icon, color: textColor, size: 18),
      label: Text(
        text,
        style: GoogleFonts.poppins(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        shadowColor: backgroundColor.withOpacity(0.3),
      ),
    );
  }

  Widget _buildContactSection() {
    return FadeInUp(
      delay: const Duration(milliseconds: 2800),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2E7D32),
                  Color(0xFF4CAF50),
                ], // Deep green to light green
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(28),
            child: Column(
              children: [
                Text(
                  '📞 Contact Information',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(3, (index) {
                  final contactInfo = [
                    {
                      'icon': FontAwesomeIcons.phone,
                      'title': 'Call Us',
                      'subtitle': phoneNumber,
                      'action': () => _makePhoneCall(),
                    },
                    {
                      'icon': FontAwesomeIcons.envelope,
                      'title': 'Email Us',
                      'subtitle': emailAddress,
                      'action': () => _sendEmail(),
                    },
                    {
                      'icon': FontAwesomeIcons.locationDot,
                      'title': 'Visit Us',
                      'subtitle': address,
                      'action': () => _openMap(),
                    },
                  ];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        delay: Duration(milliseconds: 3000 + (index * 300)),
                        child: GestureDetector(
                          onTap: contactInfo[index]['action'] as VoidCallback,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0,
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: FaIcon(
                                    contactInfo[index]['icon'] as IconData,
                                    color: const Color(0xFF2E7D32), // Deep green
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        contactInfo[index]['title'] as String,
                                        style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        contactInfo[index]['subtitle']
                                            as String,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white70,
                                          height: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _sendEmail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query:
          'subject=NTT Course Inquiry&body=Hello, I would like to know more about the NTT course.',
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openMap() async {
    final Uri launchUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri, mode: LaunchMode.externalApplication);
    }
  }

  void _showContactForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => FadeInUp(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const ContactForm(),
            ),
          ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  late AnimationController _submitController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _submitController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    _submitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),

          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Text(
              '🌱 Get in Touch',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32), // Deep green
              ),
            ),
          ),
          const SizedBox(height: 8),
          FadeInLeft(
            delay: const Duration(milliseconds: 400),
            child: Text(
              'Fill out the form below and we\'ll get back to you soon!',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 32),

          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SlideInRight(
                      delay: const Duration(milliseconds: 600),
                      child: _buildTextField(
                        controller: _nameController,
                        label: 'Full Name',
                        icon: FontAwesomeIcons.user,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    SlideInLeft(
                      delay: const Duration(milliseconds: 800),
                      child: _buildTextField(
                        controller: _emailController,
                        label: 'Email Address',
                        icon: FontAwesomeIcons.envelope,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    SlideInRight(
                      delay: const Duration(milliseconds: 1000),
                      child: _buildTextField(
                        controller: _phoneController,
                        label: 'Phone Number',
                        icon: FontAwesomeIcons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    SlideInLeft(
                      delay: const Duration(milliseconds: 1200),
                      child: _buildTextField(
                        controller: _messageController,
                        label: 'Message (Optional)',
                        icon: FontAwesomeIcons.message,
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(height: 32),

                    Bounce(
                      delay: const Duration(milliseconds: 1400),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xFF2E7D32,
                            ), // Deep green
                            foregroundColor: Colors.white,
                            elevation: 8,
                            shadowColor: const Color(
                              0xFF2E7D32,
                            ).withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child:
                              _isSubmitting
                                  ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                      strokeWidth: 2,
                                    ),
                                  )
                                  : Text(
                                    'Send Message',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: GoogleFonts.poppins(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 16),
        prefixIcon: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(
              0xFF2E7D32,
            ).withOpacity(0.1), // Light green background
            borderRadius: BorderRadius.circular(10),
          ),
          child: FaIcon(
            icon,
            color: const Color(0xFF2E7D32),
            size: 18,
          ), // Deep green icon
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF2E7D32),
            width: 2,
          ), // Deep green focused border
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // Simulate form submission
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
      });

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Thank you! We\'ll get back to you soon.',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context);
      }
    }
  }
}
