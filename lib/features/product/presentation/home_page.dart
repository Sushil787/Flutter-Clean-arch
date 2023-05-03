import 'package:clean_arch/di/di_setup.dart';
import 'package:clean_arch/features/product/domain/entity/product.dart';
import 'package:clean_arch/features/product/presentation/bloc/get_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    productBloc.add(const GetProductEvent.getProduct());
  }

  @override
  void dispose() {
    productBloc.close();
    super.dispose();
  }

  final productBloc = getIt<GetProductBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetProductBloc>(
      create: (context) => productBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<GetProductBloc, GetProductState>(
          builder: (context, state) {
            return state.maybeMap(
                success: (data) => _buildBody(data.productList),
                error: (error) => const Center(
                      child: Text("Error Loading data"),
                    ),
                orElse: () => const Center(child: CircularProgressIndicator()));
          },
        ),
      ),
    );
  }
}

Widget _buildBody(List<Product> products) {
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        floating: true,
        stretch: true,
        pinned: true,
        backgroundColor: Colors.black,
        expandedHeight: 300.0,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.fadeTitle,
          ],
          expandedTitleScale: 1,
          centerTitle: true,
          title: const Text(
            'Find your 2023 Collection',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          background: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(
                'https://cdn.dribbble.com/users/7087890/screenshots/17642457/media/502aebfe800adf2123dddf2f188dbe61.jpg?compress=1&resize=400x300&vertical=top',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        childCount: products.length,
        (context, index) {
          return _buildItem(
            product: products[index],
          );
        },
      )),
    ],
  );
}

Widget _buildItem({required Product product}) {
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    height: 300,
    width: 400,
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
              width: double.maxFinite,
              height: 200,
              child: Image.network(
                repeat: ImageRepeat.noRepeat,
                product.thumbnail,
                fit: BoxFit.cover,
              )),
        ),
        Text(product.title)
      ],
    ),
  );
}
