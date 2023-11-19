import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/providers/geo_coding_provider.dart';
import 'package:weather_app/features/weather/presentation/widgets/searched_location_details.dart';

class AddLocation extends ConsumerStatefulWidget {
  const AddLocation({super.key});

  @override
  ConsumerState<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends ConsumerState<AddLocation> {
  final _locationFieldController = TextEditingController();

  @override
  void dispose() {
    _locationFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .7,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// blank space from top 0.05 of screen height
            SizedBox(
              height: context.height * .05,
            ),

            /// input field to enter location
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter Loaction',
                border: UnderlineInputBorder(),
              ),
              controller: _locationFieldController,
            ),

            SizedBox(
              height: context.height * .06,
            ),

            const SearchedLocationDetails(),

            SizedBox(
              height: context.height * .06,
            ),

            FilledButton.tonalIcon(
              onPressed: () async {
                try {
                  final location = await ref
                      .read(geocodingProvider.notifier)
                      .getCoordinatesByAddress(
                          address: _locationFieldController.text);

                  ref.read(geocodingProvider.notifier).getAddressByCoordinates(
                      fetchAgain: true,
                      latitude: location.latitude,
                      longitude: location.longitude);
                } catch (e) {
                  if (mounted) {
                    Navigator.pop(context);
                  }

                  _showMessage(e);
                }
              },
              icon: const Icon(Icons.search),
              label: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(Object message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("$message")));
  }
}
