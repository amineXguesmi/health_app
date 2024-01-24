import 'package:flutter/material.dart';
import 'package:health_app/ui/screens/choose_doctor.dart';
import 'package:health_app/ui/widgets/loading_request.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_loading
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF43ECC0), Color(0xFF008893)],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHealthStatusCard(
                        title: 'Sleep Disorder Detected',
                        icon: Icons.nights_stay,
                        color: const Color(0xFFFF4D4D),
                      ),
                      const SizedBox(height: 16.0),
                      _buildHealthStatusCard(
                        title: 'Good Heart Health',
                        icon: Icons.favorite,
                        color: const Color(0xFF66CC66),
                      ),
                      const SizedBox(height: 32.0),
                      _buildAppointmentCard(),
                    ],
                  ),
                ),
              ),
            )
          : const LoadingRequest(),
    );
  }

  Widget _buildHealthStatusCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color.withOpacity(0.8),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              // Add action for "Learn more"
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Learn more',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.8),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Book an appointment',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E4C7B),
            ),
          ),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: () async {
              setState(() {
                _loading = true;
              });
              // await context.read<UserViewModel>().getDoctors();
              await Future.delayed(const Duration(milliseconds: 250));
              setState(() {
                _loading = false;
              });
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseDoctorScreen(),
                  ),
                );
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF1E4C7B),
              ),
              child: const Center(
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
