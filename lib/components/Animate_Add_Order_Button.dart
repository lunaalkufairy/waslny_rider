import 'package:flutter/material.dart';
import 'package:waslny_rider/constants.dart';

class AnimateAddOrderButton extends StatefulWidget {
  const AnimateAddOrderButton({Key? key}) : super(key: key);

  @override
  State<AnimateAddOrderButton> createState() => _AnimateAddOrderButtonState();
}

class _AnimateAddOrderButtonState extends State<AnimateAddOrderButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final double chevronWidth = 40.0;
  final double height = 60.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animation =
        Tween<double>(begin: 0, end: chevronWidth).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMovingChevrons(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final int chevronCount = (screenWidth / chevronWidth).ceil() + 2;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              right: -_animation.value,
              child: Row(
                children: List.generate(
                  chevronCount, // مضاعفة العدد لتغطية الفراغ
                  (_) => CustomPaint(
                    size: Size(chevronWidth, height),
                    painter: _InlineChevronPainter(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRect(child: _buildMovingChevrons(context)),
          Positioned.fill(
            child: Center(
              child: Text(
                'طلب',
                style: const TextStyle(
                    fontSize: 24, color: Colors.white, fontFamily: 'cairo'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InlineChevronPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()..color = blue;
    canvas.drawRect(Offset.zero & size, backgroundPaint);

    final Paint chevronPaint = Paint()
      ..color = const Color.fromARGB(255, 63, 91, 249);

    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.4, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.6, size.height / 2);
    path.close();

    canvas.drawPath(path, chevronPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
