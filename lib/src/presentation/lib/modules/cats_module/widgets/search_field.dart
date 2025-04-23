part of '../package.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;

  const SearchField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _cupertinoSearchTextField() : _textField();
  }

  CupertinoSearchTextField _cupertinoSearchTextField() {
    return CupertinoSearchTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: _onSearchChanged,
      placeholder: "Buscar",
      prefixIcon: const Icon(CupertinoIcons.search),
    );
  }

  TextField _textField() {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: "Buscar",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: _onSearchChanged,
    );
  }
}
