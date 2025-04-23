part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final universityAsyncValue = ref.watch(getUniversityProvider);

    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(title: const Text("Cat Breeds"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text('new project'),
              universityAsyncValue.when(
                data: (universities) {
                  // Mostrar los datos cuando la petición es exitosa
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: universities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            universities[index].name), // Ajusta según tu modelo
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Error: $error')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
