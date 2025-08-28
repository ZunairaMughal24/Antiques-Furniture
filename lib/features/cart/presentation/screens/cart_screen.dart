
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/features/categories/data/repositories/photo_repository.dart';
import 'package:antiques_furniture/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:antiques_furniture/features/categories/presentation/bloc/events.dart';
import 'package:antiques_furniture/features/categories/presentation/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(PhotoRepositoryImpl()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            "My Cart",
            style: AppTextTheme.h3(
              color: AppColors.blackColor,
              weight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotoInitial) {
              
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    log(" Fetch button clicked");
                    context.read<PhotoBloc>().add(LoadPhotosEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Fetch Photos",
                    style: AppTextTheme.bodyMedium(
                      color: AppColors.white,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            } else if (state is PhotoLoading) {
           
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotoLoaded) {
            
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                padding: const EdgeInsets.all(10),
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            photo.downloadUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              log("❌ Error loading image: $error");
                              return const Icon(Icons.broken_image, size: 50);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            photo.author,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is PhotoError) {
        
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: AppTextTheme.bodyMedium(color: AppColors.errorRed),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
