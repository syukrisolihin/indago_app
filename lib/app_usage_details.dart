
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:indago_app/widget/appbar.dart';
import 'package:usage_stats/usage_stats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUsageDetailsWidget extends StatefulWidget {
  const AppUsageDetailsWidget({super.key});

  @override
  State<AppUsageDetailsWidget> createState() => _AppUsageDetailsWidgetState();
}

class _AppUsageDetailsWidgetState extends State<AppUsageDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //final double _sliderValue1 = 75;
  //final double _sliderValue2 = 45;
  //final double _sliderValue3 = 55;

   // Initialize FirebaseAnalytics
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    Future<void> storeUsageData(List<EventUsageInfo> events) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference usageCollection = firestore.collection('app_usage'); // Choose a collection name

      for (var event in events) {
        // Store each event as a document in the collection
        await usageCollection.add({
          'packageName': event.packageName,
          'totalTimeInForeground': event.totalTimeInForeground?.inMinutes,  // Store usage in minutes
          'eventTime': event.timeStamp,
          // Add other relevant data as needed
        });
      }

      print('Usage data stored successfully!');
    } catch (e) {
      print('Error storing usage data: $e');
      // Handle the error appropriately (e.g., show an error message)
    }
  }

    // Function to fetch usage data
  Future<List<EventUsageInfo>> fetchUsageData() async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(days: 1));
      List<EventUsageInfo> events = await UsageStats.queryEvents(startDate, endDate);

      // Store the fetched data in Firestore
      await storeUsageData(events);

      return events;
    } on Exception catch (exception) {
      print('Error fetching usage data: $exception');
      rethrow; // Or handle the error as needed
    }
  }

   // Example function to log an app open event
  void _logAppOpenEvent(String appName) async {
    await analytics.logEvent(
      name: 'app_open',
      parameters: {'app_name': appName},
    );
  }

  // Example function to log an app close event
  void _logAppCloseEvent(String appName) async {
    await analytics.logEvent(
      name: 'app_close',
      parameters: {'app_name': appName},
    );
  }

  // ... (Your existing helper functions: _buildTotalScreenTimeSection, 
  // _buildTopAppsSection, _buildUsageByCategorySection, _buildInsightsSection, 
  // _buildAppUsageRow, _buildCategoryChip, _buildInsightRow, fetchUsageData

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF0F5F9),
        appBar: MinimalistAppBar(title: 'App Usage Insights'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Color(0xFFF1F4F8),
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'App Usage Insights',
                        style: TextStyle(
                          color: Color(0xFF101213),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Detailed analysis of your digital habits',
                        style: TextStyle(
                          color: Color(0xFF101213),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(32, 24, 32, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTotalScreenTimeSection(context),
                      const SizedBox(height: 24),
                      _buildTopAppsSection(context),
                      const SizedBox(height: 24),
                      _buildUsageByCategorySection(context),
                      const SizedBox(height: 24),
                      _buildInsightsSection(context),
                      const SizedBox(height: 24),
                      ElevatedButton( // "Set New App Limit" button
                        onPressed: () {
                          // Replace with your actual button action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2797FF),
                          minimumSize: Size(MediaQuery.of(context).size.width, 56),
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text('Set New App Limit'),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper functions for each section

  Widget _buildTotalScreenTimeSection(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F5F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Screen Time',
                    style: TextStyle(
                      color: Color(0xFF161C24),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E3E7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      child: Text(
                        'Last 7 Days ▼',
                        style: TextStyle(
                          color: Color(0xFF161C24),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                '3h 45m',
                style: TextStyle(
                  color: Color(0xFF2797FF),
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 4), // Added SizedBox
              const Text(
                '2h 15m daily average',
                style: TextStyle(
                  color: Color(0xFF636F81),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildTopAppsSection(BuildContext context) {
  return FutureBuilder<List<EventUsageInfo>>(
    future: fetchUsageData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return  const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        List<EventUsageInfo> events = snapshot.data!;


        // Display the top apps using the fetched data
        return Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F5F9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Top Apps by Usage',
                    style: TextStyle(
                      color: Color(0xFF161C24),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      EventUsageInfo event = events[index];
                      return ListTile(
                        leading: const Icon(Icons.apps, color: Colors.blue),
                        title: Text(event.packageName ?? 'Unknown App'),
                        trailing: Text('${event.totalTimeInForeground?.inMinutes ?? 0}m', style: const TextStyle(color: Colors.grey, fontSize: 14)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    },
  );
}

  Widget _buildAppUsageRow(
    BuildContext context,
    Color iconColor,
    IconData icon,
    String appName,
    String category,
    String usageTime,
    double sliderValue,
  ) {
    return Row(
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
                  style: const TextStyle(
                    color: Color(0xFF161C24),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  category,
                  style: const TextStyle(
                    color: Color(0xFF636F81),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          usageTime,
          style: const TextStyle(
            color: Color(0xFF2797FF),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildUsageByCategorySection(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F5F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Usage by Category',
                style: TextStyle(
                  color: Color(0xFF161C24),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildCategoryChip(context, const Color(0xFFE8F5E9), const Color(0xFF2E7D32), 'Social: 40%'),
                  _buildCategoryChip(context, const Color(0xFFE3F2FD), const Color(0xFF1565C0), 'Productivity: 25%'),
                  _buildCategoryChip(context, const Color(0xFFFFF3E0), const Color(0xFFEF6C00), 'Entertainment: 35%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, Color backgroundColor, Color textColor, String text) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildInsightsSection(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F5F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Insights',
                style: TextStyle(
                  color: Color(0xFF161C24),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildInsightRow(context, Colors.green, Icons.trending_up, 'Your productivity app usage has increased by 15% this week'),
              const SizedBox(height: 16),
              _buildInsightRow(context, Colors.orange, Icons.warning, 'You\'ve exceeded your daily limit for social media apps 3 times this week'),
              const SizedBox(height: 16),
              _buildInsightRow(context, const Color(0xFF3F51B5), Icons.nightlight, 'Consider enabling Night Mode to reduce eye strain during evening usage'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsightRow(BuildContext context, Color iconColor, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF161C24),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

extension on EventUsageInfo {
  get totalTimeInForeground => null;
}

