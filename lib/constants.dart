import 'package:cutom_world/sample_widget.dart';
import 'package:flutter/material.dart';

final List<Color> gradient = [
  Colors.deepPurple.withOpacity(0.8),
  Colors.deepPurple.withOpacity(0.5),
  Colors.deepPurple.withOpacity(0.1),
  Colors.transparent
];

/// List of screeens that we want to have in the home page
/// and navigate through them while tapping on any of the
/// bottom navigation bar items
final List<Widget> screens = [
  const SampleWidget(color: Colors.deepPurpleAccent, label: 'HOME'),
  const SampleWidget(color: Colors.amber, label: 'SEARCH'),
  const SampleWidget(color: Colors.cyan, label: 'EXPLORE'),
  const SampleWidget(color: Colors.deepOrangeAccent, label: 'SETTINGS'),
  const SampleWidget(color: Colors.redAccent, label: 'PROFILE')
];
