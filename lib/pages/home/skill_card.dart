import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.route,
    required this.borderColor,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final String route;
  final Color borderColor;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: Matrix4.identity()..translate(0.0, isHovered ? -8.0 : 0.0),
        decoration: BoxDecoration(
          gradient: isHovered
              ? LinearGradient(
                  colors: [widget.iconColor.withOpacity(.08), Colors.white],
                )
              : null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered
                ? widget.iconColor
                : widget.borderColor.withOpacity(.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? widget.iconColor.withOpacity(.25)
                  : Colors.black.withOpacity(.05),
              blurRadius: isHovered ? 25 : 10,
              spreadRadius: isHovered ? 2 : 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => context.push(widget.route),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: widget.iconColor.withOpacity(isHovered ? .2 : .1),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: isHovered ? 34 : 30,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: isHovered ? 19 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.subtitle,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),

                AnimatedRotation(
                  turns: isHovered ? 0.1 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: widget.iconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
