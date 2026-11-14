# 📱 Skill 1: Responsive Design — Flutter Guide

> A hands-on, progressive learning reference for building Flutter applications that seamlessly adapt to any screen size, orientation, and platform.
> Each section builds from core Flutter primitives up to custom reusable layouts and popular community packages.

---

## 📑 Table of Contents

- [1.1 What is Responsive Design?](#11-what-is-responsive-design)
- [1.2 MediaQuery — Reading Screen Info](#12-mediaquery--reading-screen-info)
- [1.3 LayoutBuilder — Parent-Based Constraints](#13-layoutbuilder--parent-based-constraints)
- [1.4 OrientationBuilder — Portrait vs Landscape](#14-orientationbuilder--portrait-vs-landscape)
- [1.5 Flexible & Expanded — Proportional Layouts](#15-flexible--expanded--proportional-layouts)
- [1.6 Custom Adaptive Layout](#16-custom-adaptive-layout)
- [1.7 Using `responsive_builder` Package](#17-using-responsive_builder-package)
- [1.8 Using `flutter_screenutil` Package](#18-using-flutter_screenutil-package)
- [1.9 Comparison: Which Approach When?](#19-comparison-which-approach-when)
- [🎯 What We Learned](#-what-we-learned)

---

## 1.1 What is Responsive Design?

Responsive design means your app **adapts its UI layout** to different screen sizes, device types, orientations, and pixel densities. A layout that looks great on a phone may become unusable on a tablet, desktop, or web browser if it relies on fixed dimensions.

**Why it matters:**
- Users access apps from **Mobile Phones, Tablets, Laptops, Desktops, Foldables, and Web Browsers**
- Portrait and landscape orientations drastically change available space
- Without responsive design: text overflows, buttons become too small, large screens waste space, or the UI breaks completely

**The Learning Roadmap:**
```text
MediaQuery (raw screen data)
  → LayoutBuilder (parent constraints)
    → OrientationBuilder (orientation changes)
      → Expanded & Flexible (proportional distribution)
        → Custom Adaptive Layout (reusable breakpoints)
          → Packages (responsive_builder, flutter_screenutil)
```

---

## 1.2 MediaQuery — Reading Screen Info

`MediaQuery` provides **raw information about the current screen**, allowing us to read device dimensions and make top-level layout decisions based on available size.

### How it works:

```dart
final size = MediaQuery.sizeOf(context);
final width = size.width;
final height = size.height;
```

### Breakpoints & Adaptive Grid Logic:

```dart
final crossAxisCount = width > 900
    ? 4    // Desktop
    : width > 600
        ? 3  // Tablet
        : 2; // Phone
```

| Screen Width | Device Target | Grid Columns |
| :--- | :--- | :---: |
| `< 600px` | 📱 Phone | `2` |
| `600px → 900px` | 📱 Tablet | `3` |
| `> 900px` | 🖥️ Desktop | `4` |

### What We Built:
1. **`ScreenInfoCard`**: Displays live `Screen Width`, `Screen Height`, and active `Number of Columns`.
2. **`AdaptiveGrid`**: Automatically switches between 2 columns (Phone), 3 columns (Tablet), and 4 columns (Desktop).

### ⚠️ Common Mistake:
```dart
// ❌ DON'T: Use MediaQuery inside initState() — context is not ready yet
@override
void initState() {
  super.initState();
  final width = MediaQuery.of(context).size.width; // CRASH!
}

// ✅ DO: Use MediaQuery.sizeOf(context) inside build()
@override
Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width; // ✓ Safe & performant
}
```

### 📝 Key Points:
- Great for **screen-level decisions** and direct access to screen info
- Use `MediaQuery.sizeOf(context)` instead of `MediaQuery.of(context).size` to avoid unnecessary rebuilds when keyboard/padding changes
- Less suitable for deeply nested reusable widgets (prefer `LayoutBuilder`)

---

## 1.3 LayoutBuilder — Parent-Based Constraints

`LayoutBuilder` allows widgets to adapt according to the **available space provided by their parent widget**, rather than the entire device screen.

### Visual Adaptation (Smart Product Card):

```text
Narrow Space (maxWidth ≤ 400)         Wide Space (maxWidth > 400)
┌─────────────────┐                   ┌─────────┬────────────────┐
│                 │                   │         │                │
│     Photo       │                   │  Image  │  Product Info  │
│                 │                   │         │                │
├─────────────────┤                   └─────────┴────────────────┘
│ Product Details │
└─────────────────┘
```

### Smart Product Card Example:

```dart
LayoutBuilder(
  builder: (context, constraints) {
    // Adapts strictly to parent's maxWidth, not screen width
    if (constraints.maxWidth > 400) {
      return _buildHorizontalLayout();
    }
    return _buildVerticalLayout();
  },
)
```

### What We Built:
- **Wireless Headphones Product Card**: Displays Product Image, Description, Price, and an *Add To Cart* button.
- Because it uses `LayoutBuilder`, the exact same card works seamlessly inside a `Row`, a `Grid`, on Mobile, or on Desktop without checking screen size directly.

### 📝 Key Points:
- **Parent-based adaptation** — cares only about *"How much space is available here?"*
- Much **better for reusable widgets**, cards, and modular components than `MediaQuery`

---

## 1.4 OrientationBuilder — Portrait vs Landscape

`OrientationBuilder` detects aspect ratio changes and rebuilds the UI whenever the device switches between **Portrait** (`Height > Width`) and **Landscape** (`Width > Height`).

### Visual Adaptation (Responsive Video Screen):

```text
Portrait Mode (Height > Width)        Landscape Mode (Width > Height)
┌───────────────┐                     ┌─────────┬──────────────┐
│ Video Player  │                     │  Video  │              │
└───────────────┘                     │  Player │  Video List  │
┌───────────────┐                     │         │              │
│  Video List   │                     └─────────┴──────────────┘
└───────────────┘
```

### Basic Example:

```dart
OrientationBuilder(
  builder: (context, orientation) {
    if (orientation == Orientation.portrait) {
      return PortraitLayout();
    }
    return LandscapeLayout();
  },
)
```

### What We Built (YouTube-like Adaptive Experience):
1. **`VideoPlayerWidget`**: Includes Play Button, Progress Bar, Duration Info, and Video Controls.
2. **`VideoListWidget`**: Displays Video Thumbnail, Title, Channel Info, Views, and Duration.

### 📝 Key Points:
- Ideal for **media players, readers, and camera screens**
- Provides a natural side-by-side experience in landscape mode

---

## 1.5 Flexible & Expanded — Proportional Layouts

`Flexible` and `Expanded` distribute available space **proportionally** inside `Row` and `Column` widgets.

### The Difference:

| Widget | Behavior | Visual Proportion (`flex: 2` vs `flex: 1`) |
| :--- | :--- | :--- |
| **`Expanded`** | **Must** fill all remaining available space | `██████████████████ 66%` \| `█████████ 33%` |
| **`Flexible`** | **Can** take up to available space, or remain smaller | Shrinks to child's intrinsic width if smaller |

### Code Examples:

```dart
// 1. Proportional distribution with Expanded
Row(
  children: [
    Expanded(flex: 2, child: Container()), // Takes 66%
    Expanded(flex: 1, child: Container()), // Takes 33%
  ],
)

// 2. Loose sizing with Flexible
Row(
  children: [
    Flexible(
      child: Container(width: 100), // Stays 100px if space allows
    ),
  ],
)

// 3. Practical Example: Responsive Profile Card
Row(
  children: [
    const CircleAvatar(),          // Fixed size
    Expanded(child: UserInfo()),   // Fills all middle space safely
    ElevatedButton(                // Fixed size
      onPressed: () {},
      child: const Text('Follow'),
    ),
  ],
)
```

### 📝 Key Points:
- **`Expanded`** = forced fill; **`Flexible`** = optional fill
- Use `flex` to control exact space ratios across dashboards, forms, and profile cards

---

## 1.6 Custom Adaptive Layout

Instead of repeating breakpoint conditions across every screen, we built a centralized, reusable `AdaptiveLayout` widget.

### Breakpoints & Helper Methods:

| Device Type | Condition | Helper Method |
| :--- | :--- | :--- |
| 📱 **Mobile** | `width < 600` | `AdaptiveLayout.isMobile(context)` |
| 📱 **Tablet** | `600 ≤ width < 900` | `AdaptiveLayout.isTablet(context)` |
| 🖥️ **Desktop** | `width ≥ 900` | `AdaptiveLayout.isDesktop(context)` |

### Implementation:

```dart
class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < tabletBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletBreakpoint &&
      MediaQuery.sizeOf(context).width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= desktopBreakpoint && desktop != null) {
      return desktop!;
    } else if (width >= tabletBreakpoint && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}
```

### What We Built (Movie Details Screen):
- **`MoviePoster`**: Displays Poster Artwork and Movie Icon.
- **`MovieInfo`**: Displays Movie Title, Rating, Categories, Description, and *Watch Trailer* Button.

### 📝 Key Points:
- **Centralized breakpoints** — update a number once and the entire app updates
- Clean, readable, and maintainable project architecture

---

## 1.7 Using `responsive_builder` Package

The `responsive_builder` package provides production-ready widgets with built-in breakpoints out of the box.

### Setup:
```yaml
# pubspec.yaml
dependencies:
  responsive_builder: ^0.7.1
```

### Usage Example:

```dart
ScreenTypeLayout.builder(
  mobile: (_) => MobileLayout(),   // Single-column content
  tablet: (_) => TabletLayout(),   // More spacing & balanced distribution
  desktop: (_) => DesktopLayout(), // Multi-column + navigation side panels
)
```

### 📝 Key Points:
- Less boilerplate code with built-in device breakpoints
- Easy to adopt and production-ready

---

## 1.8 Using `flutter_screenutil` Package

`flutter_screenutil` scales your entire UI proportionally based on a single reference design size (e.g., `375 × 812`).

### Setup & Initialization:

```yaml
# pubspec.yaml
dependencies:
  flutter_screenutil: ^5.9.3
```

```dart
ScreenUtilInit(
  designSize: const Size(375, 812),
  minTextAdapt: true,
  builder: (context, child) {
    return MaterialApp(
      home: HomeScreen(),
    );
  },
)
```

### Extension Cheat Sheet:

| Extension | Purpose | Usage Example |
| :--- | :--- | :--- |
| **`.w`** | Width scaling | `padding: EdgeInsets.all(16.w)` |
| **`.h`** | Height scaling | `SizedBox(height: 20.h)` |
| **`.r`** | Radius scaling | `BorderRadius.circular(12.r)` |
| **`.sp`** | Font size scaling | `fontSize: 18.sp` |

### What We Built:
- Responsive Header, Scaled Typography, and Responsive Cards where every spacing, radius, and font size adapts automatically via `.w`, `.h`, `.r`, and `.sp`.

---

## 1.9 Comparison: Which Approach When?

| Technique | Best Use Case | Scope |
| :--- | :--- | :--- |
| **`MediaQuery`** | Read raw screen dimensions & top-level grids | Screen-wide |
| **`LayoutBuilder`** | Reusable cards & widgets adapting to parent space | Component-level |
| **`OrientationBuilder`** | Portrait vs. Landscape UI switching | Orientation-based |
| **`Expanded`** | Force child to fill remaining space | Row / Column |
| **`Flexible`** | Allow child to shrink or use available space | Row / Column |
| **`AdaptiveLayout`** | App-wide custom breakpoints & clean architecture | Project-wide |
| **`responsive_builder`** | Quick multi-device layouts with built-in breakpoints | Project-wide |
| **`flutter_screenutil`** | Proportional UI, font, and radius scaling from Figma | Pixel-level scaling |

> **💡 Pro Tip:** In production apps, combine `flutter_screenutil` for proportional typography/spacing with `LayoutBuilder` or a custom `AdaptiveLayout` for structural layout switching.

---

## 🎯 What We Learned

After completing this skill, we can:
- Read screen dimensions safely with `MediaQuery.sizeOf(context)`
- Build self-contained adaptive components using `LayoutBuilder`
- Detect and respond to orientation changes via `OrientationBuilder`
- Distribute space proportionally using `Flexible` and `Expanded`
- Architect a reusable `AdaptiveLayout` widget with centralized breakpoints
- Integrate `responsive_builder` and `flutter_screenutil` for Mobile, Tablet, Desktop, and Web