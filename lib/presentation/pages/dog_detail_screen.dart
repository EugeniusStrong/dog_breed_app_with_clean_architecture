import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../domain/entities/dog_entity.dart';
import '../widgets/dog_cache_image_widget.dart';

class DogDetailPage extends StatelessWidget {
  final DogEntity dog;

  const DogDetailPage({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFO'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              dog.name ?? '',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            DogCacheImage(
                imageUrl: dog.image?.url ?? '', width: 400, height: 400),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.pets_rounded,
                  color: Colors.green,
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    dog.bredFor ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ...buildText('Temperament:', dog.temperament ?? ''),
            ...buildText('Live span:', dog.lifeSpan ?? ''),
            ...buildText('Weight', '${dog.weight?.metric} Kg'),
            ...buildText('Height', '${dog.height!.metric} cm'),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(
          color: AppColors.greyColor,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
