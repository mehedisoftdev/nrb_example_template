import 'dart:io' show Directory, File, Platform;
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:nrb/nrb.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InnovateNestDashboard(),
    ),
  );
}

class InnovateNestDashboard extends StatefulWidget {
  const InnovateNestDashboard({super.key});

  @override
  State<InnovateNestDashboard> createState() => _InnovateNestDashboardState();
}

class _InnovateNestDashboardState extends State<InnovateNestDashboard> {
  // --- INNVOATE NEST LABS BRAND COLORS ---
  final Color primaryBrandColor = const Color(0xFF0B7A3E); // Brand Green
  final Color secondaryAccent = const Color(0xFF1E88E5); // Blue
  final Color backgroundGray = const Color(0xFFF5F7FA);

  // ===========================================================================
  // REPORT DATA: Financials (Complex Nested Headers)
  // ===========================================================================
  final _headers = [
    const HeaderCell(
      text: "Q4 Financials (USD)",
      span: 3,
      backgroundColor: Color(0xFF0B7A3E),
    ),
    const HeaderCell(
      text: "Operations",
      span: 2,
      backgroundColor: Color(0xFF0B7A3E),
    ),
  ];

  final _subHeaders = [
    const SubHeaderCell(
      text: "Target Rev.",
      backgroundColor: Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    const SubHeaderCell(
      text: "Actual Rev.",
      backgroundColor: Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    const SubHeaderCell(
      text: "Margin %",
      backgroundColor: Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    const SubHeaderCell(
      text: "Active Clients",
      backgroundColor: Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    const SubHeaderCell(
      text: "SLA Uptime",
      backgroundColor: Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
  ];

  final _leftColumns = [
    const TextCell(itemContent: "Custom Web Apps", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "Mobile Development", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "Enterprise ERP", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "Cloud Hosting", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "AI & Machine Learning", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "UI/UX Design", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "Cybersecurity", textAlignment: Alignment.centerLeft),
    const TextCell(itemContent: "Data Analytics", textAlignment: Alignment.centerLeft),
  ];

  final _tableData = [
    [
      const TextCell(itemContent: "450000", isAmount: true),
      const TextCell(itemContent: "480000", isAmount: true),
      const TextCell(itemContent: "28%"),
      const TextCell(itemContent: "42"),
      const TextCell(itemContent: "99.9%"),
    ],
    [
      const TextCell(itemContent: "385000", isAmount: true),
      const TextCell(itemContent: "355000", isAmount: true),
      const TextCell(itemContent: "22%"),
      const TextCell(itemContent: "28"),
      const TextCell(itemContent: "99.8%"),
    ],
    [
      const TextCell(itemContent: "850000", isAmount: true),
      const TextCell(itemContent: "910000", isAmount: true),
      const TextCell(itemContent: "35%"),
      const TextCell(itemContent: "8"),
      const TextCell(itemContent: "99.99%"),
    ],
    [
      const TextCell(itemContent: "210000", isAmount: true),
      const TextCell(itemContent: "210000", isAmount: true),
      const TextCell(itemContent: "18%"),
      const TextCell(itemContent: "115"),
      const TextCell(itemContent: "99.99%"),
    ],
    [
      const TextCell(itemContent: "540000", isAmount: true),
      const TextCell(itemContent: "620000", isAmount: true),
      const TextCell(itemContent: "40%"),
      const TextCell(itemContent: "14"),
      const TextCell(itemContent: "99.5%"),
    ],
    [
      const TextCell(itemContent: "125000", isAmount: true),
      const TextCell(itemContent: "145000", isAmount: true),
      const TextCell(itemContent: "30%"),
      const TextCell(itemContent: "55"),
      const TextCell(itemContent: "N/A"),
    ],
    [
      const TextCell(itemContent: "280000", isAmount: true),
      const TextCell(itemContent: "295000", isAmount: true),
      const TextCell(itemContent: "45%"),
      const TextCell(itemContent: "19"),
      const TextCell(itemContent: "100%"),
    ],
    [
      const TextCell(itemContent: "415000", isAmount: true),
      const TextCell(itemContent: "450000", isAmount: true),
      const TextCell(itemContent: "38%"),
      const TextCell(itemContent: "26"),
      const TextCell(itemContent: "99.8%"),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      appBar: AppBar(
        title: const Text(
          'Innovate Nest Labs - Executive Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isDesktop = constraints.maxWidth > 900;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // =================================================================
                // ROW 1: TOP KPI CARDS
                // =================================================================
                const Text(
                  "Quarterly Overview",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    _buildKpiCard("Project Completion", 85.5, primaryBrandColor),
                    _buildGaugeCard("Revenue Target", 92.0),
                    const NrbMetricCard(
                      title: "Active Projects",
                      value: "142",
                      backgroundColor: Color(0xFF1976D2), // Blue
                      width: 160,
                      height: 120,
                    ),
                    const NrbMetricCard(
                      title: "Pending QA",
                      value: "18",
                      backgroundColor: Color(0xFFFFA726), // Orange
                      width: 160,
                      height: 120,
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // =================================================================
                // ROW 2: ANALYTICS CHARTS (Responsive Row/Column)
                // =================================================================
                const Text(
                  "Performance Analytics",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 16),
                
                if (isDesktop)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 4, child: _buildRevenueBarChart()),
                      const SizedBox(width: 16),
                      Expanded(flex: 3, child: _buildDistributionPieChart()),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildRevenueBarChart(),
                      const SizedBox(height: 16),
                      _buildDistributionPieChart(),
                    ],
                  ),

                const SizedBox(height: 32),

                // =================================================================
                // ROW 3: THE NRB DATA TABLE
                // =================================================================
                const Text(
                  "Detailed Service Financials",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Table includes freeze-panes and supports one-click export to PDF/Excel.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                
                Container(
                  height: 450, // Fixed height for scrollable table
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ReportMaker(
                    headers: _headers,
                    subHeaders: _subHeaders,
                    leftColumn: _leftColumns,
                    tableData: _tableData,
                    stickyHeaderLabel: "Service Division",
                    stickyHeaderBackgroundColor: primaryBrandColor,
                    stickyHeaderForegroundColor: Colors.white,
                    
                    // -- Export Settings (Using your demo credentials) --
                    packageName: "com.innovatenestlabs.demoapp",
                    apiKey: "", 
                    enableDownload: true,
                    showDownloadFloatingButton: true,
                    reportName: "INL_Q4_Financials",
                    onDownloadCompleted: _handleDownloadSuccess,
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  // ===========================================================================
  // WIDGET BUILDERS FOR DASHBOARD
  // ===========================================================================

  Widget _buildRevenueBarChart() {
    return _buildCardWrapper(
      title: "Monthly Revenue (Last 6 Months)",
      child: const NrbBarChart(
        height: 220,
        data: [120, 150, 180, 220, 300, 280],
        labels: ["Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        barColor: Color(0xFF0B7A3E), // INL Green
        barSpacing: 16.0,
      ),
    );
  }

  Widget _buildDistributionPieChart() {
    return _buildCardWrapper(
      title: "Revenue by Division",
      child: Center(
        child: NrbPieChart(
          size: 180,
          slices: [
            NrbPieSlice(value: 45, color: const Color(0xFF1E88E5), label: "Web/Mobile"),
            NrbPieSlice(value: 30, color: const Color(0xFF0B7A3E), label: "ERP/Cloud"),
            NrbPieSlice(value: 25, color: const Color(0xFFFFA726), label: "AI & Consulting"),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWrapper({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }

  Widget _buildKpiCard(String title, double value, Color color) {
    return Container(
      width: 160,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha:0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NrbDonutChart(
            value: value,
            size: 55,
            progressColor: color,
            trackColor: Colors.grey.shade200,
            strokeWidth: 6,
            centerContent: Text(
              "${value.toStringAsFixed(0)}%",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildGaugeCard(String title, double percentage) {
    return Container(
      width: 160,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 55,
            child: NrbGaugeChart(
              value: percentage,
              size: 110,
              strokeWidth: 10.0,
              showLabels: false,
              segments: [
                NrbGaugeSegment(startValue: 0, endValue: 50, color: const Color(0xFFF0716A)),
                NrbGaugeSegment(startValue: 50, endValue: 75, color: const Color(0xFFFFCA3A)),
                NrbGaugeSegment(startValue: 75, endValue: 100, color: const Color(0xFF67B28C)),
              ],
              centerContent: Text(
                "${percentage.toStringAsFixed(0)}%",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
        ],
      ),
    );
  }

  // ===========================================================================
  // DOWNLOAD HANDLER FOR NATIVE DEVICES
  // ===========================================================================
  Future<void> _handleDownloadSuccess(Uint8List bytes, String fileName) async {
    if (!kIsWeb) {
      bool hasPermission = false;

      if (Platform.isAndroid) {
        final deviceInfo = DeviceInfoPlugin();
        final androidInfo = await deviceInfo.androidInfo;

        if (androidInfo.version.sdkInt >= 33) {
          hasPermission = true;
        } else {
          var status = await Permission.storage.status;
          if (!status.isGranted) {
            status = await Permission.storage.request();
          }
          hasPermission = status.isGranted;
        }
      } else {
        hasPermission = true; // iOS/Desktop
      }

      if (hasPermission) {
        try {
          final directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            await directory.create(recursive: true);
          }

          final file = File('${directory.path}/$fileName');
          await file.writeAsBytes(bytes);

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('✅ Report saved to Downloads: $fileName'),
                backgroundColor: const Color(0xFF0B7A3E),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('❌ Save failed: $e'), backgroundColor: Colors.red),
            );
          }
        }
      }
    }
  }
}