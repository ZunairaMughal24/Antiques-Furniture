// // photo_page.dart
// import 'package:antiques_furniture/features/categories/presentation/bloc/categories_bloc.dart';
// import 'package:antiques_furniture/features/categories/presentation/bloc/events.dart';
// import 'package:antiques_furniture/features/categories/presentation/bloc/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class PhotoGrid extends StatelessWidget {
//   const PhotoGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Photos")),
//       body: BlocBuilder<PhotoBloc, PhotoState>(
//         builder: (context, state) {
//           if (state is PhotoInitial) {
//             // trigger loading
//             context.read<PhotoBloc>().add(LoadPhotosEvent());
//             return const Center(child: Text("Loading photos..."));
//           } else if (state is PhotoLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is PhotoLoaded) {
//             return GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,       // number of columns
//                 crossAxisSpacing: 10,    // spacing between columns
//                 mainAxisSpacing: 10,     // spacing between rows
//                 childAspectRatio: 1,     // width/height ratio
//               ),
//               padding: const EdgeInsets.all(10),
//               itemCount: state.photos.length,
//               itemBuilder: (context, index) {
//                 final photo = state.photos[index];
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Image.network(
//                           photo.url,   // assuming your model has a `url`
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           photo.title,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else if (state is PhotoError) {
//             return Center(child: Text("Error: ${state.message}"));
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }
