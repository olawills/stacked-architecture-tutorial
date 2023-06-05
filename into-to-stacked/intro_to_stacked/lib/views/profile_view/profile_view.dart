import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              children: const [
                Text('Profile View'),
              ],
            ),
          ),
        );
      },
    );
  }
}
