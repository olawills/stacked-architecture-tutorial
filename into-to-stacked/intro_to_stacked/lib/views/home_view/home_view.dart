import 'package:flutter/material.dart';
import 'package:intro_to_stacked/views/home_view/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Stacked Tutorial',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  model.getDeclaredvars,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () => model.updateText(),
                  child: const Text('Update text'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => model.navigateToTodoScreen(),
                  child: const Text('Todo View'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
