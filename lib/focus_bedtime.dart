import 'package:flutter/material.dart';

class FocusBedtimeWidget extends StatefulWidget {
  const FocusBedtimeWidget({super.key});

  @override
  State<FocusBedtimeWidget> createState() => _FocusBedtimeWidgetState();
}

class _FocusBedtimeWidgetState extends State<FocusBedtimeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _switchValue1 = true;
  bool _switchValue2 = true;
  bool _switchValue3 = true;
  bool _switchValue4 = true;
  double _sliderValue = 25;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              'Indago',
              style: TextStyle(
                color: Color(0xFF101213),
                fontWeight: FontWeight.w600,
                fontSize: 24,
                letterSpacing: 0.0,
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 15,
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFocusModeCard(context),
                const SizedBox(height: 24),
                _buildBedtimeModeCard(context),
                const SizedBox(height: 24),
                _buildModeSettingsCard(context),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Replace with your actual button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6F61EF),
                    minimumSize: Size(MediaQuery.of(context).size.width, 56),
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    textStyle: const TextStyle(
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
    );
  }

  // Helper functions for each card

  Widget _buildFocusModeCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Focus Mode',
                style: TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
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
                        'Enable Focus Mode',
                        style: TextStyle(
                          color: Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Block distractions and stay productive',
                        style: TextStyle(
                          color: Color(0xFF606A85),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _switchValue1,
                    onChanged: (newValue) => setState(() => _switchValue1 = newValue),
                    activeColor: const Color(0xFF6F61EF),
                    activeTrackColor: const Color(0xFF606A85),
                    inactiveTrackColor: const Color(0xFFE0E0E0),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Duration',
                        style: TextStyle(
                          color: Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '25 minutes focus',
                            style: TextStyle(
                              color: Color(0xFF606A85),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '5 minutes break',
                            style: TextStyle(
                              color: Color(0xFF6F61EF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 300,
                        child: Slider(
                          activeColor: const Color(0xFF6F61EF),
                          inactiveColor: const Color(0xFFE0E0E0),
                          min: 0,
                          max: 60,
                          value: _sliderValue,
                          onChanged: (newValue) =>
                              setState(() => _sliderValue = newValue),
                        ),
                      ),
                      const SizedBox(height: 12), // Added SizedBox for spacing
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Added SizedBox for spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBedtimeModeCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Bedtime Mode',
                style: TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
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
                        'Enable Bedtime Mode',
                        style: TextStyle(
                          color: Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Prepare for better sleep',
                        style: TextStyle(
                          color: Color(0xFF606A85),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _switchValue2,
                    onChanged: (newValue) => setState(() => _switchValue2 = newValue),
                    activeColor: const Color(0xFF6F61EF),
                    activeTrackColor: const Color(0xFF606A85),
                    inactiveTrackColor: const Color(0xFFE0E0E0),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Schedule',
                        style: TextStyle(
                          color: Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bedtime',
                            style: TextStyle(
                              color: Color(0xFF606A85),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '10:30 PM',
                            style: TextStyle(
                              color: Color(0xFF6F61EF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wake up',
                            style: TextStyle(
                              color: Color(0xFF606A85),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '6:30 AM',
                            style: TextStyle(
                              color: Color(0xFF6F61EF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12), // Added SizedBox for spacing
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Added SizedBox for spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeSettingsCard(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Mode Settings',
                style: TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
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
                        'Do Not Disturb',
                        style: TextStyle(
                          color: Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Silence all notifications',
                        style: TextStyle(
                          color: Color(0xFF606A85),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _switchValue3,
                    onChanged: (newValue) => setState(() => _switchValue3 = newValue),
                    activeColor: const Color(0xFF6F61EF),
                    activeTrackColor: const Color(0xFF606A85),
                    inactiveTrackColor: const Color(0xFFE0E0E0),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grayscale',
                        style: TextStyle(
                          color: Color(0xFF15161E),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Remove colors from screen',
                        style: TextStyle(
                          color: Color(0xFF606A85),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _switchValue4,
                    onChanged: (newValue) => setState(() => _switchValue4 = newValue),
                    activeColor: const Color(0xFF6F61EF),
                    activeTrackColor: const Color(0xFF606A85),
                    inactiveTrackColor: const Color(0xFFE0E0E0),
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 16), // Added SizedBox for spacing
            ],
          ),
        ),
      ),
    );
  }
}