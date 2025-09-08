import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math' as math;

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final double borderRadius;
  final double blurIntensity;
  final double opacity;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final LightingDirection lightingDirection;
  final double lightingIntensity;
  final bool showSparkles;
  final VoidCallback? onTap;

  const GlassContainer({
    Key? key,
    this.child,
    this.width = 200,
    this.height = 100,
    this.borderRadius = 20,
    this.blurIntensity = 10,
    this.opacity = 0.2,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 1.5,
    this.padding,
    this.margin,
    this.lightingDirection = LightingDirection.topLeft,
    this.lightingIntensity = 0.5,
    this.showSparkles = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurIntensity,
              sigmaY: blurIntensity,
            ),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: _buildLightingGradient(),
                border: Border.all(
                  color: borderColor.withOpacity(0.3),
                  width: borderWidth,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Stack(
                children: [
                  // Main content
                  Container(
                    padding: padding ?? EdgeInsets.all(16),
                    child: child,
                  ),
                  // Sparkle effects
                  if (showSparkles) _buildSparkles(),
                  // Light reflection
                  _buildLightReflection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient _buildLightingGradient() {
    final lightColor = backgroundColor.withOpacity(
      opacity + lightingIntensity * 0.3,
    );
    final shadowColor = backgroundColor.withOpacity(
      opacity - lightingIntensity * 0.1,
    );

    switch (lightingDirection) {
      case LightingDirection.topLeft:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lightColor, shadowColor],
        );
      case LightingDirection.topRight:
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [lightColor, shadowColor],
        );
      case LightingDirection.bottomLeft:
        return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [lightColor, shadowColor],
        );
      case LightingDirection.bottomRight:
        return LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [lightColor, shadowColor],
        );
      case LightingDirection.top:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lightColor, shadowColor],
        );
      case LightingDirection.bottom:
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [lightColor, shadowColor],
        );
    }
  }

  Widget _buildSparkles() {
    return Positioned.fill(
      child: CustomPaint(
        painter: SparklePainter(
          sparkleCount: 6,
          lightingDirection: lightingDirection,
        ),
      ),
    );
  }

  Widget _buildLightReflection() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: _buildReflectionGradient(),
        ),
      ),
    );
  }

  LinearGradient _buildReflectionGradient() {
    final highlightColor = Colors.white.withOpacity(0.4 * lightingIntensity);
    final transparentColor = Colors.transparent;

    switch (lightingDirection) {
      case LightingDirection.topLeft:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.center,
          colors: [highlightColor, transparentColor],
          stops: [0.0, 0.7],
        );
      case LightingDirection.topRight:
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.center,
          colors: [highlightColor, transparentColor],
          stops: [0.0, 0.7],
        );
      case LightingDirection.bottomLeft:
        return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.center,
          colors: [highlightColor, transparentColor],
          stops: [0.0, 0.7],
        );
      case LightingDirection.bottomRight:
        return LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.center,
          colors: [highlightColor, transparentColor],
          stops: [0.0, 0.7],
        );
      case LightingDirection.top:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [highlightColor, transparentColor],
          stops: [0.0, 0.6],
        );
      case LightingDirection.bottom:
        return LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [highlightColor, transparentColor],
          stops: [0.0, 0.6],
        );
    }
  }
}

enum LightingDirection {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  top,
  bottom,
}

class SparklePainter extends CustomPainter {
  final int sparkleCount;
  final LightingDirection lightingDirection;

  SparklePainter({required this.sparkleCount, required this.lightingDirection});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final random = math.Random(42); // Fixed seed for consistent sparkles

    for (int i = 0; i < sparkleCount; i++) {
      double x, y;

      // Position sparkles based on lighting direction
      switch (lightingDirection) {
        case LightingDirection.topLeft:
          x = random.nextDouble() * size.width * 0.6;
          y = random.nextDouble() * size.height * 0.6;
          break;
        case LightingDirection.topRight:
          x = size.width * 0.4 + random.nextDouble() * size.width * 0.6;
          y = random.nextDouble() * size.height * 0.6;
          break;
        case LightingDirection.bottomLeft:
          x = random.nextDouble() * size.width * 0.6;
          y = size.height * 0.4 + random.nextDouble() * size.height * 0.6;
          break;
        case LightingDirection.bottomRight:
          x = size.width * 0.4 + random.nextDouble() * size.width * 0.6;
          y = size.height * 0.4 + random.nextDouble() * size.height * 0.6;
          break;
        case LightingDirection.top:
          x = random.nextDouble() * size.width;
          y = random.nextDouble() * size.height * 0.5;
          break;
        case LightingDirection.bottom:
          x = random.nextDouble() * size.width;
          y = size.height * 0.5 + random.nextDouble() * size.height * 0.5;
          break;
      }

      _drawSparkle(canvas, Offset(x, y), 2 + random.nextDouble() * 3, paint);
    }
  }

  void _drawSparkle(Canvas canvas, Offset center, double size, Paint paint) {
    // Draw a 4-pointed star sparkle
    final path = Path();

    // Vertical line
    path.moveTo(center.dx, center.dy - size);
    path.lineTo(center.dx, center.dy + size);

    // Horizontal line
    path.moveTo(center.dx - size, center.dy);
    path.lineTo(center.dx + size, center.dy);

    paint.strokeWidth = 1;
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);

    // Add center dot
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(center, size * 0.3, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Animated version for dynamic lighting changes
class AnimatedGlassContainer extends StatefulWidget {
  final Widget? child;
  final double width;
  final double height;
  final double borderRadius;
  final double blurIntensity;
  final double opacity;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Duration animationDuration;
  final bool showSparkles;
  final VoidCallback? onTap;

  const AnimatedGlassContainer({
    Key? key,
    this.child,
    this.width = 200,
    this.height = 100,
    this.borderRadius = 20,
    this.blurIntensity = 10,
    this.opacity = 0.2,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderWidth = 1.5,
    this.padding,
    this.margin,
    this.animationDuration = const Duration(seconds: 3),
    this.showSparkles = true,
    this.onTap,
  }) : super(key: key);

  @override
  State<AnimatedGlassContainer> createState() => _AnimatedGlassContainerState();
}

class _AnimatedGlassContainerState extends State<AnimatedGlassContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final directions = LightingDirection.values;
        final currentIndex = (_animation.value * directions.length).floor();
        final nextIndex = (currentIndex + 1) % directions.length;
        final progress = (_animation.value * directions.length) - currentIndex;

        // Interpolate between current and next lighting direction
        final lightingIntensity =
            0.5 + 0.3 * math.sin(_animation.value * 2 * math.pi);

        return GlassContainer(
          width: widget.width,
          height: widget.height,
          borderRadius: widget.borderRadius,
          blurIntensity: widget.blurIntensity,
          opacity: widget.opacity,
          backgroundColor: widget.backgroundColor,
          borderColor: widget.borderColor,
          borderWidth: widget.borderWidth,
          padding: widget.padding,
          margin: widget.margin,
          lightingDirection: directions[currentIndex],
          lightingIntensity: lightingIntensity,
          showSparkles: widget.showSparkles,
          onTap: widget.onTap,
          child: widget.child,
        );
      },
    );
  }
}

// Example usage widget
class GlassEffectDemo extends StatefulWidget {
  @override
  _GlassEffectDemoState createState() => _GlassEffectDemoState();
}

class _GlassEffectDemoState extends State<GlassEffectDemo> {
  LightingDirection currentDirection = LightingDirection.topLeft;
  double blurIntensity = 10;
  double opacity = 0.2;
  double lightingIntensity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade900,
              Colors.blue.shade900,
              Colors.indigo.shade900,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Static glass container
              GlassContainer(
                width: 300,
                height: 120,
                lightingDirection: currentDirection,
                blurIntensity: blurIntensity,
                opacity: opacity,
                lightingIntensity: lightingIntensity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome, color: Colors.white, size: 24),
                    SizedBox(width: 12),
                    Text(
                      'Generate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Animated glass container
              AnimatedGlassContainer(
                width: 250,
                height: 80,
                child: Center(
                  child: Text(
                    'Animated Glass',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

              // Controls
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Lighting Direction
                    Text(
                      'Lighting Direction',
                      style: TextStyle(color: Colors.white),
                    ),
                    Wrap(
                      spacing: 8,
                      children: LightingDirection.values.map((direction) {
                        return ChoiceChip(
                          label: Text(direction.name),
                          selected: currentDirection == direction,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                currentDirection = direction;
                              });
                            }
                          },
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20),

                    // Blur Intensity
                    Text(
                      'Blur Intensity: ${blurIntensity.toStringAsFixed(1)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: blurIntensity,
                      min: 0,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          blurIntensity = value;
                        });
                      },
                    ),

                    // Opacity
                    Text(
                      'Opacity: ${opacity.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: opacity,
                      min: 0.1,
                      max: 0.8,
                      onChanged: (value) {
                        setState(() {
                          opacity = value;
                        });
                      },
                    ),

                    // Lighting Intensity
                    Text(
                      'Lighting Intensity: ${lightingIntensity.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Slider(
                      value: lightingIntensity,
                      min: 0.0,
                      max: 1.0,
                      onChanged: (value) {
                        setState(() {
                          lightingIntensity = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
