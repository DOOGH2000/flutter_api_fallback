import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/repo/primary_repo_impel.dart';
import '../../../data/repo/secondary_impel_repo.dart';
import '../../controller/ser_product_cubit.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class HomeService extends StatelessWidget {
  const HomeService({super.key});

  @override
  Widget build(BuildContext context) {
    final serProductCubit = SerProductCubit.get(context);


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          bool success = await serProductCubit.getProducts(
            PrimaryRepoImpel(),
          );
          print(success);
          if (!success) {
            await serProductCubit.getProducts(
              SecondaryImpelRepo(),
            );
          }
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SerProductCubit, SerProductState>(
                builder: (context, state) {
                  if (state is ProductLodingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SerError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  } else if (state is SerSuccess) {
                    final product = serProductCubit.productsData;
                    if (product != null) {
                      return Expanded(
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text(product[0].title),
                              subtitle: Text(product[0].description),
                              trailing: Text('\$${product[0].price.toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('No data available'),
                      );
                    }
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}