part of '../package.dart';

class CatCard extends StatelessWidget {
  final String imageUrl;
  final String breedName;
  final String country;
  final int intelligence;
  final VoidCallback? onTap;

  const CatCard({
    super.key,
    required this.imageUrl,
    required this.breedName,
    required this.country,
    required this.intelligence,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final urlOptional =
        imageUrl.isEmpty ? "https://picsum.photos/200" : imageUrl;

    return Platform.isIOS ? _iosCard(urlOptional) : _androidCard(urlOptional);
  }

  Widget _iosCard(String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: CupertinoColors.systemGrey3,
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.all(12.0),
          child: _widgetList(url),
        ),
      ),
    );
  }

  GestureDetector _androidCard(String url) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _widgetList(url),
        ),
      ),
    );
  }

  Column _widgetList(String url) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _breedName(),
        const SizedBox(height: 8),
        _image(url),
        const SizedBox(height: 8),
        _countryAndIntelligence(),
      ],
    );
  }

  Row _breedName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          breedName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "Más...",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Image _image(String url) {
    return Image.network(
      url,
      height: 120,
      width: 120,
      fit: BoxFit.cover,
    );
  }

  Row _countryAndIntelligence() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "País de origen: $country",
          style: const TextStyle(fontSize: 12),
        ),
        Text(
          "Inteligencia: $intelligence",
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
