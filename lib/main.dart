import 'package:flutter/material.dart';
import 'package:nrb/nrb.dart';

final primaryColor = Color(0xFF0B7A3E);

void main() {
  runApp(MaterialApp(home: TemplateOfNRB()));
}

class TemplateOfNRB extends StatefulWidget {
  const TemplateOfNRB({super.key});

  @override
  State<TemplateOfNRB> createState() => _TemplateOfNRBState();
}

class _TemplateOfNRBState extends State<TemplateOfNRB> {
  final _headers = [
    HeaderCell(
      text: "Financials (USD)",
      span: 3,
      backgroundColor: const Color(0xFF0B7A3E), // Brand Accent
    ),
    HeaderCell(
      text: "Operations",
      span: 2,
      backgroundColor: const Color(0xFF0B7A3E),
    ),
  ];

  final _subHeaders = [
    SubHeaderCell(
      text: "Gross Rev.",
      backgroundColor: const Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    SubHeaderCell(
      text: "Op. Expenses",
      backgroundColor: const Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    SubHeaderCell(
      text: "Net Profit",
      backgroundColor: const Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    SubHeaderCell(
      text: "Active Clients",
      backgroundColor: const Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
    SubHeaderCell(
      text: "SLA Uptime",
      backgroundColor: const Color(0xFF0B7A3E),
      foregroundColor: Colors.white,
    ),
  ];

  final _leftColumns = [
    TextCell(
      itemContent: "Custom Web Applications",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "Mobile App Development",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "Enterprise ERP Solutions",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "Cloud Hosting & DevOps",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "AI & Machine Learning",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "UI/UX Design Services",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "E-Commerce Platforms",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "API Development",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "Cybersecurity Audits",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(
      itemContent: "Data Analytics & BI",
      textAlignment: Alignment.centerLeft,
    ),
    TextCell(itemContent: "IT Consulting", textAlignment: Alignment.centerLeft),
    TextCell(
      itemContent: "Maintenance & Support",
      textAlignment: Alignment.centerLeft,
    ),
  ];

  final _tableData = [
    // Web Apps
    [
      TextCell(itemContent: "450,000", isAmount: true),
      TextCell(itemContent: "180,000", isAmount: true),
      TextCell(itemContent: "270,000", isAmount: true),
      TextCell(itemContent: "42"),
      TextCell(itemContent: "99.9%"),
    ],
    // Mobile Apps
    [
      TextCell(itemContent: "385,500", isAmount: true),
      TextCell(itemContent: "155,000", isAmount: true),
      TextCell(itemContent: "230,500", isAmount: true),
      TextCell(itemContent: "28"),
      TextCell(itemContent: "99.8%"),
    ],
    // ERP
    [
      TextCell(itemContent: "850,000", isAmount: true),
      TextCell(itemContent: "320,000", isAmount: true),
      TextCell(itemContent: "530,000", isAmount: true),
      TextCell(itemContent: "8"),
      TextCell(itemContent: "99.99%"),
    ],
    // Cloud
    [
      TextCell(itemContent: "210,000", isAmount: true),
      TextCell(itemContent: "95,000", isAmount: true),
      TextCell(itemContent: "115,000", isAmount: true),
      TextCell(itemContent: "115"),
      TextCell(itemContent: "99.99%"),
    ],
    // AI & ML
    [
      TextCell(itemContent: "540,200", isAmount: true),
      TextCell(itemContent: "210,000", isAmount: true),
      TextCell(itemContent: "330,200", isAmount: true),
      TextCell(itemContent: "14"),
      TextCell(itemContent: "99.5%"),
    ],
    // UI/UX
    [
      TextCell(itemContent: "125,000", isAmount: true),
      TextCell(itemContent: "45,000", isAmount: true),
      TextCell(itemContent: "80,000", isAmount: true),
      TextCell(itemContent: "55"),
      TextCell(itemContent: "N/A"),
    ],
    // E-Commerce
    [
      TextCell(itemContent: "310,000", isAmount: true),
      TextCell(itemContent: "110,000", isAmount: true),
      TextCell(itemContent: "200,000", isAmount: true),
      TextCell(itemContent: "34"),
      TextCell(itemContent: "99.9%"),
    ],
    // API Dev
    [
      TextCell(itemContent: "195,000", isAmount: true),
      TextCell(itemContent: "65,000", isAmount: true),
      TextCell(itemContent: "130,000", isAmount: true),
      TextCell(itemContent: "22"),
      TextCell(itemContent: "99.95%"),
    ],
    // Cybersec
    [
      TextCell(itemContent: "280,000", isAmount: true),
      TextCell(itemContent: "90,000", isAmount: true),
      TextCell(itemContent: "190,000", isAmount: true),
      TextCell(itemContent: "19"),
      TextCell(itemContent: "100%"),
    ],
    // Data Analytics
    [
      TextCell(itemContent: "415,000", isAmount: true),
      TextCell(itemContent: "140,000", isAmount: true),
      TextCell(itemContent: "275,000", isAmount: true),
      TextCell(itemContent: "26"),
      TextCell(itemContent: "99.8%"),
    ],
    // IT Consulting
    [
      TextCell(itemContent: "150,000", isAmount: true),
      TextCell(itemContent: "30,000", isAmount: true),
      TextCell(itemContent: "120,000", isAmount: true),
      TextCell(itemContent: "45"),
      TextCell(itemContent: "N/A"),
    ],
    // Maintenance
    [
      TextCell(itemContent: "290,000", isAmount: true),
      TextCell(itemContent: "85,000", isAmount: true),
      TextCell(itemContent: "205,000", isAmount: true),
      TextCell(itemContent: "88"),
      TextCell(itemContent: "99.9%"),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReportMaker(
          headers: _headers,
          subHeaders: _subHeaders,
          leftColumn: _leftColumns,
          tableData: _tableData,
          stickyHeaderLabel: "Service/Division",
          stickyHeaderBackgroundColor: primaryColor,
        ),
      ),
    );
  }
}
