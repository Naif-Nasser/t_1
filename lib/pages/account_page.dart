import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_account_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String username = "اسم المستخدم";
  String email = "email@example.com";
  String? profileImagePath;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("username") ?? "اسم المستخدم";
      email = prefs.getString("email") ?? "email@example.com";
      profileImagePath = prefs.getString("profile_image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حسابي")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (profileImagePath != null) {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: const EdgeInsets.all(10),
                          child: InteractiveViewer(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(profileImagePath!),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF690108),
                      image: profileImagePath != null
                          ? DecorationImage(
                              image: FileImage(File(profileImagePath!)),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: profileImagePath == null
                        ? const Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),

              const SizedBox(height: 25),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF690108),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),

              ListTile(
                leading: const Icon(Icons.edit, color: Color(0xFF690108)),
                title: const Text(
                  "تعديل البيانات",
                  style: TextStyle(color: Color(0xFF690108)),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF690108),
                ),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditAccountPage()),
                  );
                  loadUserData();
                },
              ),

              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF690108)),
                title: const Text(
                  "حول التطبيق",
                  style: TextStyle(color: Color(0xFF690108)),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF690108),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "تسجيل الخروج",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  loadUserData();
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
