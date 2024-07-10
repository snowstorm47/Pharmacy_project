import 'package:flutter/material.dart';

import '../domain/models/dashboard_cards_modes.dart';

class HealthDetails {
  final healthData = const [
    HealthModel(
        color: Color(0xFF5B74CC),
        icon: Icon(
          Icons.medical_information,
          color: Colors.white,
          size: 30.0,
        ),
        value: '120',
        title: 'Total Medicine'),
    HealthModel(
        color: Color(0xFF19F671),
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 30.0,
        ),
        value: '234',
        title: 'Total Sales'),
    HealthModel(
        color: Color(0xFFF0DE39),
        icon: Icon(
          Icons.add_alert,
          color: Colors.white,
          size: 30.0,
        ),
        value: '459',
        title: 'Expired Medicine'),
    HealthModel(
        color: Color(0xFFFF3B20),
        icon: Icon(
          Icons.hourglass_empty,
          color: Colors.white,
          size: 30.0,
        ),
        value: '56',
        title: 'Out of Stock'),
  ];
}
