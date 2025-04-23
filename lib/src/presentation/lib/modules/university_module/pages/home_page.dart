part of '../package.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final universityAsyncValue = ref.watch(getUniversityProvider);

    return BaseTemplate(
      titleAppar: 'Listado de universidades',
      centerTitleAppar: true,
      body: universityAsyncValue.when(
        data: (universities) {
          if (universities.isEmpty) {
            return _isEmptyList();
          }
          return _listViewCards(universities);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Center _isEmptyList() {
    return const Center(
      child: Text(
        'No se encontraron universidades.',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  ListView _listViewCards(List<UniversityDomain> universities) {
    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: universities.length,
      itemBuilder: (context, index) {
        final university = universities[index];
        return CustomCard(
          name: university.name,
          country: university.country,
          onTap: () {
            ref.read(selectedUniversityProvider.notifier).state = university;
            context.go(RouteNames.detailPage.path);
          },
        );
      },
    );
  }
}
