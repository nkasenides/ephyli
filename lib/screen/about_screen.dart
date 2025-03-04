import 'package:ephyli/screen/privacy_policy.dart';
import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_images.dart';
import '../utils/pref_utils.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  bool isInAdminMode = false;

  late Future<void> future;
  late SharedPreferences prefs;
  late PackageInfo packageInfo;
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordNode = FocusNode();

  Future<void> getData() async {
    prefs = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  void initState() {
    super.initState();
    future = getData();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String appName = packageInfo.appName;
          String packageName = packageInfo.packageName;
          String version = packageInfo.version;
          String buildNumber = packageInfo.buildNumber;

          isInAdminMode = prefs.getBool(PrefUtils.admin_mode) ?? false;

          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: Themes.standardPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Image.asset(AppImages.logo, width: 200,),

                    const Divider(),

                    const Gap(20),

                    Text(AppLocalizations.of(context)!.project_description, textAlign: TextAlign.center,),

                    const Gap(20),

                    OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(Icons.open_in_new),
                      label: Text(AppLocalizations.of(context)!.visit_website),
                      onPressed: () {
                        UIUtils.visitLink("https://www.ephyliproject.eu/");
                      },
                    ),

                    // const Gap(10),

                    // OutlinedButton.icon(
                    //   iconAlignment: IconAlignment.end,
                    //   icon: const Icon(Icons.open_in_new),
                    //   label: Text(AppLocalizations.of(context)!.about_the_app),
                    //   onPressed: () {
                    //     UIUtils.visitLink("https://www.ephyliproject.eu/app");
                    //   },
                    // ),

                    const Gap(10),

                    OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(Icons.open_in_new),
                      label: Text(AppLocalizations.of(context)!.privacy_policy),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),));
                      },
                    ),

                    const Gap(20),

                    const Divider(),

                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: [

                        Image.asset("assets/img/uclan_logo.png", width: 100),
                        Image.asset("assets/img/idl_logo.png", width: 100),
                        Image.asset("assets/img/grantxpert_logo.png", width: 100),

                      ],
                    ),

                    const Divider(),

                    const Gap(20),

                    SwitchListTile(
                      title: Text("Admin mode"),
                      value: isInAdminMode,
                      onChanged: (value) {
                        if (value) {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Text("Enter admin password"),
                              content: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                              ),
                              actions: [
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(AppLocalizations.of(context)!.cancel),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    if (passwordController.text == "eephylii") {
                                      setState(() {
                                        prefs.setBool(PrefUtils.admin_mode, value);
                                        isInAdminMode = value;
                                        Fluttertoast.showToast(msg: "Admin mode is now enabled");
                                      });
                                    }
                                    else {
                                      Fluttertoast.showToast(msg: "Invalid password. Please try again.");
                                      passwordController.clear();
                                    }
                                    passwordController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text(AppLocalizations.of(context)!.ok),
                                ),
                              ],
                            );
                          },);
                        }
                        else {
                          setState(() {
                            prefs.setBool(PrefUtils.admin_mode, value);
                            isInAdminMode = value;
                            if (value) {
                              Fluttertoast.showToast(msg: "Admin mode is now enabled");
                            }
                          });
                        }
                      },
                    ),

                    const Gap(20),

                    Text("Version: $version", textAlign: TextAlign.center,),


                  ],
                ),
              ),
            ),
          );

        }
        else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );




  }
}
