import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/cubits/cubit/store_cubit.dart';
import 'package:store/model/product_model.dart';
import '../components/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit()..getAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "New Trend",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 65),
          child: BuildProducts(),
        ),
      ),
    );
  }
}

// class BuildProducts extends StatelessWidget {
//   const BuildProducts({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ProductModel>>(
//       future: AllProductsService().getAllProducts(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<ProductModel> products = snapshot.data!;
//           return GridView.builder(
//             itemCount: products.length,
//             clipBehavior: Clip.none,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               childAspectRatio: 1.5,
//               mainAxisSpacing: 100,
//             ),
//             itemBuilder: (context, index) {
//               return CustomCard(
//                 productt: products[index],
//               );
//             },
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

class BuildProducts extends StatelessWidget {
  const BuildProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state is StoreLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StoreSuccess) {
          List<ProductModel> products = state.products;
          return GridView.builder(
            itemCount: products.length,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              mainAxisSpacing: 100,
            ),
            itemBuilder: (context, index) {
              return CustomCard(
                productt: products[index],
              );
            },
          );
        } else if (state is StoreFailure) {
          return Center(child: Text('Error: ${state.errMessage}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
