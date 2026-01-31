import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final theme = Theme.of(context);
    final delegate = LocalizedApp.of(context).delegate;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(translate("settings")),
        backgroundColor: theme.primaryColor,
      ),
      body: ListView(
        children: [
          // Account
          ListTile(
            leading: Icon(Icons.person, color: theme.textTheme.bodyMedium?.color),
            title: Text(translate("account"), style: theme.textTheme.bodyMedium),
            onTap: () {},
          ),

          // 🌍 Switch لتغيير اللغة
          SwitchListTile(
            title: Row(
              children: [
                Icon(Icons.language, color: theme.textTheme.bodyMedium?.color),
                SizedBox(width: 15),
                Text(translate("language"), style: theme.textTheme.bodyMedium),
              ],
            ),
            value: delegate.currentLocale.languageCode == 'ar', // ON = Arabic
            onChanged: (value) async {
              Locale newLocale = value ? const Locale('ar') : const Locale('en');

              // تغيير اللغة + اتجاه التطبيق فورًا
              await delegate.changeLocale(newLocale);

              // إعادة بناء الواجهة عشان Switch يتحدث فورًا
              setState(() {});
            },
          ),

          // 🌙 Switch للـ Dark Mode
          SwitchListTile(
            title: Row(
              children: [
                Icon(Icons.dark_mode, color: theme.textTheme.bodyMedium?.color),
                SizedBox(width: 15),
                Text(translate("dark_mode"), style: theme.textTheme.bodyMedium),
              ],
            ),
            value: themeProvider.isDark,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),

          // Notifications
          ListTile(
            leading: Icon(Icons.notifications, color: theme.textTheme.bodyMedium?.color),
            title: Text(translate("notifications"), style: theme.textTheme.bodyMedium),
            onTap: () {},
          ),

          // Logout
          ListTile(
            leading: Icon(Icons.logout, color: theme.textTheme.bodyMedium?.color),
            title: Text(translate("logout"), style: theme.textTheme.bodyMedium),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
