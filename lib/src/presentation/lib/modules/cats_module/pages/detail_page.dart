part of '../package.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final selectedCat = ref.watch(selectedCatProvider);

    /*  if (selectedCat == null) {
      return _errorScreen();
    } */

    return Scaffold(
      appBar: _appBar(''),
      body: Column(
        children: [
          //_catImage(''),
          const SizedBox(height: 16),
          //Expanded(child: _catDetails(selectedCat)),
        ],
      ),
    );
  }

  AppBar _appBar(String title) {
    return AppBar(
      leading: const BackButton(),
      title: Text(title),
      centerTitle: true,
    );
  }

/*   SizedBox _catImage(String? imageUrl) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(
        imageUrl ?? "https://picsum.photos/200",
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }
 */

  Scaffold _errorScreen() {
    return Scaffold(
      appBar: _appBar("Error"),
      body: const Center(child: Text('No se ha seleccionado ningún gato')),
    );
  }
}
