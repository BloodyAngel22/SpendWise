import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';

class SearchField extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;
  final String hintText;

  const SearchField({
    super.key,
    required this.onSearchChanged,
    required this.hintText,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  final Debouncer _debouncer = Debouncer();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    _debouncer.debounce(
      duration: Duration(milliseconds: 350),
      onDebounce: () {
        widget.onSearchChanged(value);
      },
    );
  }

  void _clearText() {
    _controller.clear();
    widget.onSearchChanged('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Icon(Icons.search, size: 32),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        suffixIcon: _controller.text.isNotEmpty
            ? Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                  icon: Icon(Icons.clear, size: 32),
                  onPressed: _clearText,
                ),
            )
            : null,
      ),
      onChanged: (value) {
        _onTextChanged(value);
        setState(() {});
      },
      controller: _controller,
    );
  }
}
