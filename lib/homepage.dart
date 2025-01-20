import 'package:flutter/material.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  double sliderValue1 = 55;
  double sliderValue2 = 29;
  double sliderValue3 = 16;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.format_align_justify,
                color: Color(0xFF0F1113),
                size: 30,
              ),
              onPressed: () => Navigator.pushNamed(context, 'MenuPage'),
            ),
            title: const Text(
              'Indago',
              style: TextStyle(
                color: Color(0xFF0F1113),
                fontWeight: FontWeight.w600,
                fontSize: 24,
                letterSpacing: 0.0,
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 10,
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTodaysScreenTimeCard(),
                const SizedBox(height: 24),
                _buildMostUsedAppsCard(context),
                const SizedBox(height: 24),
                _buildAppCategoriesCard(context, sliderValue1, sliderValue2, sliderValue3),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTodaysScreenTimeCard() {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
                'Today\'s Screen Time',
                style: TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '4h 32m',
                    style: TextStyle(
                      color: Color(0xFF6F61EF),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6F61EF), Color(0xFF39D2C0)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        const Center(
                          child: Text(
                            '75%',
                            style: TextStyle(
                              color: Color(0xFF15161E),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                'of your 6-hour daily limit',
                style: TextStyle(
                  color: Color(0xFF606A85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMostUsedAppsCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
                'Most Used Apps',
                style: TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              _buildAppRow(context, Icons.question_mark, 'Instagram', '1h 45m', const Color(0xFF6F61EF), '38%'),
              const SizedBox(height: 16),
              _buildAppRow(context, Icons.youtube_searched_for, 'YouTube', '1h 20m', const Color(0xFFEE8B60), '29%'),
              const SizedBox(height: 16),
              _buildAppRow(context, Icons.timer, 'Twitter', '45m', const Color(0xFF39D2C0), '16%'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppRow(BuildContext context, IconData icon, String appName, String usageTime, Color iconColor, String percentage) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: const TextStyle(
                    color: Color(0xFF15161E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  usageTime,
                  style: const TextStyle(
                    color: Color(0xFF606A85),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          percentage,
          style: TextStyle(
            color: iconColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildAppCategoriesCard(BuildContext context, double sliderValue1, double sliderValue2, double sliderValue3) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
                'App Categories',
                style: TextStyle(
                  color: Color(0xFF15161E),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16), // Spacing
              _buildCategoryRow('Social', '2h 30m', sliderValue1, const Color(0xFF6F61EF)),
              const SizedBox(height: 16), // Spacing
              _buildCategoryRow('Entertainment', '1h 20m', sliderValue2, const Color(0xFFEE8B60)),
              const SizedBox(height: 16), // Spacing
              _buildCategoryRow('Productivity', '42m', sliderValue3, const Color(0xFF39D2C0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(String categoryName, String usageTime, double sliderValue, Color sliderColor) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryName,
              style: const TextStyle(
                color: Color(0xFF15161E),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              usageTime,
              style: const TextStyle(
                color: Color(0xFF606A85),
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 150,
          child: Slider(
            activeColor: sliderColor,
            inactiveColor: const Color(0xFFE0E0E0),
            min: 0,
            max: 100,
            value: sliderValue,
            onChanged: (newValue) {
              // Update the slider value using setState or your preferred state management solution
              // For example:
              // setState(() {
              //   if (categoryName == 'Social') {
              //     sliderValue1 = newValue;
              //   } else if (categoryName == 'Entertainment') {
              //     sliderValue2 = newValue;
              //   } else if (categoryName == 'Productivity') {
              //     sliderValue3 = newValue;
              //   }
              // });
            },
          ),
        ),
      ],
    );
  }
}