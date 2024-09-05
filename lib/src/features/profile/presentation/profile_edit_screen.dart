import 'package:flutter/material.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';

class ProfileEditScreen extends StatefulWidget {
  static const String route = '/profile/edit';
  static const String routeName = 'profile_edit';
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMHeader.modal(),
    );
  }
}
