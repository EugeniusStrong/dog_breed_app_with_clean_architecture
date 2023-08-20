import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../domain/entities/dog_entity.dart';
import '../pages/dog_detail_screen.dart';
import 'dog_cache_image_widget.dart';

class DogCard extends StatelessWidget {
  final DogEntity dog;

  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogDetailPage(dog: dog),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cellBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: DogCacheImage(
                width: 200,
                height: 200,
                imageUrl:
                    'https://cdn2.thedogapi.com/images/${dog.referenceImageId}.jpg',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      dog.name ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.pets_sharp,
                        color: Colors.green,
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(dog.bredFor ?? '')),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Temperament:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(dog.temperament ?? ''),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
