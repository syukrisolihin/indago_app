import 'package:flutter/material.dart';

class SetUsageLimitWidget extends StatefulWidget {
  const SetUsageLimitWidget({super.key});

  @override
  State<SetUsageLimitWidget> createState() => _SetUsageLimitWidgetState();
}

class _SetUsageLimitWidgetState extends State<SetUsageLimitWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final bool _switchValue1 = true;
  final bool _switchValue2 = true;
  final bool _switchValue3 = true;
  bool _switchValue4 = true;
  bool _switchValue5 = true;
  final double _sliderValue1 = 75;
  final double _sliderValue2 = 75;
  final double _sliderValue3 = 83;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8), // Replace with your actual color
        appBar: AppBar(
          backgroundColor: const Color(0xFFF1F4F8), // Replace with your actual color
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF101213), // Replace with your actual color
              size: 24,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Indago',
            style: TextStyle( // Changed from GoogleFonts to TextStyle
              color: Color(0xFF101213), // Replace with your actual color
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 0.0,
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 10,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTodaysProgressCard(context),
                  const SizedBox(height: 24),
                  _buildAppLimitsCard(context),
                  const SizedBox(height: 24),
                  _buildNotificationSettingsCard(context),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Replace with your actual button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3), // Replace with your actual color
                      minimumSize: Size(MediaQuery.of(context).size.width, 56),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      textStyle: const TextStyle( // Changed from GoogleFonts to TextStyle
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper functions for each card

  Widget _buildTodaysProgressCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8), // Replace with your actual color
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Today\'s Progress',
                style: TextStyle( // Changed from GoogleFonts to TextStyle
                  color: Color(0xFF101213), // Replace with your actual color
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Screen Time',
                        style: TextStyle( // Changed from GoogleFonts to TextStyle
                          color: Color(0xFF101213), // Replace with your actual color
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '3h 45m / 5h',
                        style: TextStyle( // Changed from GoogleFonts to TextStyle
                          color: Color(0xFF2196F3), // Replace with your actual color
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4F8), // Replace with your actual color
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xFF2196F3), // Replace with your actual color
                        width: 8,
                      ),
                    ),
                    child: const Center( // Use Center instead of Padding
                      child: Text(
                        '75%',
                        style: TextStyle( // Changed from GoogleFonts to TextStyle
                          color: Color(0xFF2196F3), // Replace with your actual color
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppLimitsCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8), // Replace with your actual color
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'App Limits',
                    style: TextStyle( // Changed from GoogleFonts to TextStyle
                      color: Color(0xFF101213), // Replace with your actual color
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white, // Replace with your actual color
                      size: 24,
                    ),
                    onPressed: () {
                      // Replace with your actual button action
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3), // Replace with your actual color
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12), // Spacing
              _buildAppLimitRow(
                context,
                const Color(0x4C4B39EF), // Replace with your actual color
                Icons.facebook,
                'Facebook',
                '1h 30m / 2h',
                _switchValue1,
                _sliderValue1,
              ),
              const SizedBox(height: 12), // Spacing
              _buildAppLimitRow(
                context,
                const Color(0x4D39D2C0), // Replace with your actual color
                Icons.question_mark,
                'Instagram',
                '45m / 1h',
                _switchValue2,
                _sliderValue2,
              ),
              const SizedBox(height: 12), // Spacing
              _buildAppLimitRow(
                context,
                const Color(0x4DEE8B60), // Replace with your actual color
                Icons.youtube_searched_for,
                'YouTube',
                '1h 15m / 1h 30m',
                _switchValue3,
                _sliderValue3,
              ),
              const SizedBox(height: 12), // Spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppLimitRow(
    BuildContext context,
    Color iconColor,
    IconData icon,
    String appName,
    String limit,
    bool switchValue,
    double sliderValue,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E3E7), // Replace with your actual color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appName,
                          style: const TextStyle( // Changed from GoogleFonts to TextStyle
                            color: Color(0xFF101213), // Replace with your actual color
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          limit,
                          style: const TextStyle( // Changed from GoogleFonts to TextStyle
                            color: Color(0xFF57636C), // Replace with your actual color
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: switchValue,
                  onChanged: (newValue) => setState(() => switchValue = newValue), // Update switchValue
                  activeColor: const Color(0xFF2196F3), // Replace with your actual color
                  activeTrackColor: const Color(0xFF9E9E9E), // Replace with your actual color
                  inactiveTrackColor: const Color(0xFF9E9E9E), // Replace with your actual color
                  inactiveThumbColor: const Color(0xFFE0E0E0), // Replace with your actual color
                ),
              ],
            ),
            const SizedBox(height: 12), // Spacing
            Slider(
              activeColor: const Color(0xFF2196F3), // Replace with your actual color
              inactiveColor: const Color(0xFFE0E0E0), // Replace with your actual color
              min: 0,
              max: 100,
              value: sliderValue,
              onChanged: (newValue) => setState(() => sliderValue = newValue), // Update sliderValue
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSettingsCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8), // Replace with your actual color
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Notification Settings',
                style: TextStyle( // Changed from GoogleFonts to TextStyle
                  color: Color(0xFF101213), // Replace with your actual color
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 16), // Spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Approaching Limit Alert',
                    style: TextStyle( // Changed from GoogleFonts to TextStyle
                      color: Color(0xFF101213), // Replace with your actual color
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: _switchValue4,
                    onChanged: (newValue) => setState(() => _switchValue4 = newValue),
                    activeColor: const Color(0xFF2196F3), // Replace with your actual color
                    activeTrackColor: const Color(0xFF9E9E9E), // Replace with your actual color
                    inactiveTrackColor: const Color(0xFF9E9E9E), // Replace with your actual color
                    inactiveThumbColor: const Color(0xFFE0E0E0), // Replace with your actual color
                  ),
                ],
              ),
              const SizedBox(height: 16), // Spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Limit Exceeded Alert',
                    style: TextStyle( // Changed from GoogleFonts to TextStyle
                      color: Color(0xFF101213), // Replace with your actual color
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: _switchValue5,
                    onChanged: (newValue) => setState(() => _switchValue5 = newValue),
                    activeColor: const Color(0xFF2196F3), // Replace with your actual color
                    activeTrackColor: const Color(0xFF9E9E9E), // Replace with your actual color
                    inactiveTrackColor: const Color(0xFF9E9E9E), // Replace with your actual color
                    inactiveThumbColor: const Color(0xFFE0E0E0), // Replace with your actual color
                  ),
                ],
              ),
              const SizedBox(height: 16), // Spacing
            ],
          ),
        ),
      ),
    );
  }
}