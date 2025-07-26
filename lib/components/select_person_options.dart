import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class SelectPersonalOptions extends StatefulWidget {
  const SelectPersonalOptions({Key? key}) : super(key: key);

  @override
  State<SelectPersonalOptions> createState() => _SelectPersonalOptionsState();
}

class _SelectPersonalOptionsState extends State<SelectPersonalOptions> {
  // العناصر المتاحة
  final List<String> _options = [
    'مكيف هواء',
    'كرسي للأطفال',
    'مساحة خاصة للأمتعة',
    'سائقات نساء ققط',
    'USB شاحن لاسلكي/ شاحن',
  ];

  // مجموعة تحتوي على العناصر المختارة
  final Set<int> _selectedIndices = {};

  void _printSelectedOptions() {
    final selectedOptions = _selectedIndices.map((i) => _options[i]).toList();
    print('الخيارات المختارة: $selectedOptions');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(_options.length, (index) {
          final bool isSelected = _selectedIndices.contains(index);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedIndices.remove(index);
                } else {
                  _selectedIndices.add(index);
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected ? blue : black,
                border: Border.all(color: blue),
                borderRadius: BorderRadius.circular(23),
              ),
              width: 360,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isSelected
                      ? const Icon(Icons.check, color: Colors.white)
                      : const SizedBox(width: 24),
                  Text(
                    _options[index],
                    style: TextStyle(
                      color: isSelected ? white : blue,
                      fontSize: 15,
                      fontFamily: 'cairo',
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _printSelectedOptions,
          style: ElevatedButton.styleFrom(
            backgroundColor: blue,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'عرض الخيارات المختارة',
            style: TextStyle(fontFamily: 'cairo'),
          ),
        ),
      ],
    );
  }
}
