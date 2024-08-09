import 'package:flutter/material.dart';

enum DROPDOWNITEMS {
  branch,
  subject,
  semester,
  type,
}

class Variables {
  static List<DropdownMenuItem<String>> semesterList = [
    const DropdownMenuItem(value: '1', child: Text('1')),
    const DropdownMenuItem(value: '2', child: Text('2')),
    const DropdownMenuItem(value: '3', child: Text('3')),
    const DropdownMenuItem(value: '4', child: Text('4')),
    const DropdownMenuItem(value: '5', child: Text('5')),
    const DropdownMenuItem(value: '6', child: Text('6')),
    const DropdownMenuItem(value: '7', child: Text('7')),
  ];
  static List<DropdownMenuItem<String>> departmentList = [
    const DropdownMenuItem(value: 'CSE', child: Text('CSE')),
    const DropdownMenuItem(value: 'ECE', child: Text('ECE')),
    const DropdownMenuItem(value: 'MEA', child: Text('MEA')),
    const DropdownMenuItem(value: 'MNC', child: Text('MNC')),
  ];
  static List<DropdownMenuItem<String>> categoryList = [
    const DropdownMenuItem(value: 'Notes', child: Text('Notes')),
    const DropdownMenuItem(value: 'PYQs', child: Text('PYQs')),
    const DropdownMenuItem(value: 'Quizs', child: Text('Quizs')),
    const DropdownMenuItem(value: 'Assignments', child: Text('Assignments')),
  ];
  static Map<String, List<DropdownMenuItem<String>>> subjectList = {
    "CSE1": [
      "Select subject",
      "Engineering Mathematics-I",
      "Engineering Physics",
      "Electrical Sciences",
      "Computer Programming",
      "Professional Communication",
      "Engineering Graphics",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE2": [
      "Select subject",
      "Engineering Mathematics-II",
      "Data Structures and Algorithms",
      "Digital Design",
      "Semiconductor Devices and Circuits ",
      "Engineering Materials ",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE3": [
      "Select subject",
      'Engineering Mathematics III',
      'Object Oriented Programming',
      'Discrete Mathematics',
      'Design and Analysis of Algorithms',
      'Computer Organization and Architecture',
      'Management Concepts and Technology',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE4": [
      "Select subject",
      'Operating Systems',
      'Formal Language and Automata Theory',
      'Microprocessor and Interfacing',
      'Database Management Systems',
      'Probability and Statistics'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE5": [
      "Select subject",
      'Digital Signal Processing',
      'Data Communication',
      'Software Engineering',
      'IoT and Embedded System',
      'Artificial Intelligence'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE6": [
      "Select subject",
      'Compiler Design',
      'Computer Networks',
      'Computer Graphics',
      'Machine Learning',
      'Environmental Sciences',
      'Introduction to Cryptography',
      'Data Compression and Protection',
      'Advanced Computer Architecture',
      'Distributed Operating System',
      'Formal Methods & Verification',
      'Introduction to Data Mining'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE7": [
      "Select subject",
      'Professional Ethics for Engineers',
      'VLSI Design Verification and Testing',
      'Foundations of Cloud Computing',
      'Computational Geometry',
      'Information Retrieval',
      'Wireless Sensor Network',
      'Network Security',
      'Introduction to Networks on Chip',
      'Introduction to Multimedia Systems',
      'Parallel Algorithms',
      'Introduction to Deep Learning',
      'Cyber Security and Forensics',
      'Introduction to Hardware Security',
      'Open Elective',
      'Foreign Language'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "CSE8": [
      "Select subject",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE1": [
      "Select subject",
      "Engineering Mathematics-I",
      "Engineering Physics",
      "Electrical Sciences",
      "Computer Programming",
      "Professional Communication",
      "Engineering Graphics",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE2": [
      "Select subject",
      "Engineering Mathematics-II",
      "Data Structures and Algorithms",
      "Digital Design",
      "Semiconductor Devices and Circuits ",
      "Engineering Materials ",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE3": [
      "Select subject",
      'Engineering Mathematics III',
      'Object Oriented Programming',
      'Analog Communication',
      'Electromagnetic Theory',
      'Measurement & Instrumentation',
      'Management Concepts and Technology',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE4": [
      "Select subject",
      'Analog Electronics',
      'Digital Communication',
      'Microprocessor and Interfacing',
      'Signals and Systems ',
      'Probability and Statistics'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE5": [
      "Select subject",
      'Digital Signal Processing',
      'Control Systems',
      'Introduction to VLSI Design ',
      'IoT and Embedded System',
      'Artificial Intelligence'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE6": [
      "Select subject",
      'Antenna & Microwave Engineering',
      'COptical Communication & Networks',
      'Computer Vision',
      'Recent Trends in Wireless Comm. ',
      'Environmental Sciences',
      'Introduction to Cryptography',
      'Data Compression and Protection',
      'Advanced Computer Architecture',
      'Distributed Operating System',
      'Formal Methods & Verification',
      'Introduction to Data Mining'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE7": [
      "Select subject",
      'Professional Ethics for Engineers',
      'VLSI Design Verification and Testing',
      'Foundations of Cloud Computing',
      'Computational Geometry',
      'Information Retrieval',
      'Wireless Sensor Network',
      'Network Security',
      'Introduction to Networks on Chip',
      'Introduction to Multimedia Systems',
      'Parallel Algorithms',
      'Introduction to Deep Learning',
      'Cyber Security and Forensics',
      'Introduction to Hardware Security',
      'Open Elective',
      'Foreign Language'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "ECE8": [
      "Select subject",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA1": [
      "Select subject",
      "Engineering Mathematics-I",
      "Engineering Physics",
      "Electrical Sciences",
      "Computer Programming",
      "Professional Communication",
      "Engineering Graphics",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA2": [
      "Select subject",
      "Engineering Mathematics-II",
      "Data Structures and Algorithms",
      "Digital Design",
      "Semiconductor Devices and Circuits ",
      "Engineering Materials ",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA3": [
      "Select subject",
      'Engineering Mathematics III',
      'Object Oriented Programming',
      'Solid Mechanics',
      'Thermodynamics ',
      'Electrical Machine ',
      'Management Concepts and Technology',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA4": [
      "Select subject",
      'Analog Electronics',
      'Design of Machine Elements',
      'Kinematics of Machines',
      'Manufacturing Science',
      'Probability and Statistics'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA5": [
      "Select subject",
      'Digital Signal Processing',
      'Control Systems',
      'Dynamics of Machinery',
      'IoT and Embedded System',
      'Artificial Intelligence',
      "Sensors and Actuators"
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA6": [
      "Select subject",
      'Mechatronics and Automation',
      'Industrial Engineering,CAD/CAM',
      'Computational Intelligence,FEM ',
      'Electric Hybrid vehicle',
      'Micro-manuf. ,Composite Materials ',
      'Scientific Computation,OME',
      'MEMS and NEMS, Power Electronics',
      'Machine Learning',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA7": [
      "Select subject",
      'Professional Ethics for Engineers',
      'Robotics',
      'Mechanical Vibration',
      'Data Science,Reinforcement Learning',
      'Electro-mechanics & Magnetic Propulsion',
      'Open Elective',
      'Foreign Language'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MEA8": [
      "Select subject",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC1": [
      "Select subject",
      "Engineering Mathematics-I",
      "Engineering Physics",
      "Electrical Sciences",
      "Computer Programming",
      "Professional Communication",
      "Engineering Graphics",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC2": [
      "Select subject",
      "Engineering Mathematics-II",
      "Data Structures and Algorithms",
      "Digital Design",
      "Semiconductor Devices and Circuits ",
      "Engineering Mechanics ",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC3": [
      "Select subject",
      'Engineering Mathematics III',
      'Object Oriented Programming',
      'Discrete Mathematics',
      'Design and Analysis of Algorithms',
      'Computer Organization and Architecture',
      'Management Concepts and Technology',
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC4": [
      "Select subject",
      'Optimization ',
      'Operating Systems',
      'Formal Language and Automata ',
      'Database Management Systems',
      'Probability and Statistics'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC5": [
      "Select subject",
      'Mathematical Finance',
      'Abstract Algebra',
      'Scientific Computing',
      'Real Analysis',
      'Artificial Intelligence'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC6": [
      "Select subject",
      'Stochastic Process ',
      'Number Theory and Cryptography',
      'Functional Analysis ',
      'Machine Learning',
      'Environmental Sciences & Green Technology',
      'Fluid Dynamics',
      'Mathematical Methods',
      'FEM',
      'Image processing',
      'Data Compression and Protection',
      'Computational Intelligence ',
      'Combinatorial Optimization ',
      'General Topology',
      'Measure Theory'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC7": [
      "Select subject",
      'Professional Ethics for Engineers',
      'Elective-II',
      'Elective-III',
      'Open Elective',
      'Foreign Language'
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    "MNC8": [
      "Select subject",
    ].map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  };
}
