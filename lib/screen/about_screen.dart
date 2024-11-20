import 'package:ephyli/theme/themes.dart';
import 'package:ephyli/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../theme/app_images.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          PackageInfo packageInfo = snapshot.data!;
          String appName = packageInfo.appName;
          String packageName = packageInfo.packageName;
          String version = packageInfo.version;
          String buildNumber = packageInfo.buildNumber;

          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: Themes.standardPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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

                    const Gap(10),

                    OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(Icons.open_in_new),
                      label: Text(AppLocalizations.of(context)!.about_the_app),
                      onPressed: () {
                        UIUtils.visitLink("https://www.ephyliproject.eu/app");
                      },
                    ),

                    const Gap(20),

                    Text("Version: $version - Alpha"),


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
