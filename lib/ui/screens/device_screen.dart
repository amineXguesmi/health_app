import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text('Your Devices', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.watch),
                title: const Text('Apple Watch'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: const Icon(Icons.scale),
                title: const Text('Smart Scale'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Text('Add a Device', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add a Device'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(height: 20, thickness: 1),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text('Shop Devices', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                children: [
                  Card(
                    child:Row(
                      children: [
                        const Icon(Icons.watch),
                        const Text('Apple Watch'),
                      ],
                    ),
                  ),
                  Card(
                    child:Row(
                      children: [
                        const Icon(Icons.watch),
                        const Text('Apple Watch'),
                      ],
                    ),
                  ),
                  Card(
                    child:Row(
                      children: [
                        const Icon(Icons.watch),
                        const Text('Apple Watch'),
                      ],
                    ),
                  ),
                  Card(
                    child:Row(
                      children: [
                        const Icon(Icons.watch),
                        const Text('Apple Watch'),
                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      )
    );
  }
}