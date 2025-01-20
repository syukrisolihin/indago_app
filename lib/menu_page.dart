import 'package:flutter/material.dart';

class MenuPageWidget extends StatefulWidget {
  const MenuPageWidget({super.key});

  @override
  State<MenuPageWidget> createState() => _MenuPageWidgetState();
}

class _MenuPageWidgetState extends State<MenuPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8), // Replace with your actual color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F4F8), // Replace with your actual color
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF0F1113), // Replace with your actual color
            size: 25,
          ),
          onPressed: () async {
            Navigator.pop(context); // Use Navigator.pop() to go back
          },
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            child: Text(
              'Menu Page',
              style: TextStyle( // Changed from GoogleFonts to TextStyle
                fontSize: 28, // Adjust font size as needed
                fontWeight: FontWeight.w600, // Adjust font weight as needed
                letterSpacing: 0.0,
                color: Color(0xFF0F1113), // Set text color
              ),
            ),
          ),
          Expanded( // Use Expanded to make ListView take available space
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                _buildMenuItem(
                  'View Detailed Insights',
                  Icons.chevron_right_rounded,
                  () => Navigator.pushNamed(context, 'AppUsageDetails'),
                ),
                _buildMenuItem(
                  'Usage Limit',
                  Icons.chevron_right_rounded,
                  () => Navigator.pushNamed(context, 'SetUsageLimit'),
                ),
                _buildMenuItem(
                  'Focus Mode',
                  Icons.chevron_right_rounded,
                  () => Navigator.pushNamed(context, 'FocusBedtime'),
                ),
                _buildMenuItem(
                  'Bedtime Mode',
                  Icons.chevron_right_rounded,
                  () => Navigator.pushNamed(context, 'FocusBedtime'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            // Add any desired decoration here (e.g., border, color)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle( // Changed from GoogleFonts to TextStyle
                    fontSize: 22, // Adjust font size as needed
                    fontWeight: FontWeight.w500, // Adjust font weight as needed
                    letterSpacing: 0.0,
                    color: Color(0xFF0F1113), // Set text color
                  ),
                ),
                Icon(
                  icon,
                  color: const Color(0xFF57636C), // Replace with your actual color
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}