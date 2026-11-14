📱 Skill 1: Responsive Design
Learn how to build Flutter applications that adapt to different screen sizes, orientations, and platforms using Flutter's built-in responsive tools and popular community packages.

📑 Table of Contents
1.1 What is Responsive Design?
1.2 MediaQuery
1.3 LayoutBuilder
1.4 OrientationBuilder
1.5 Flexible & Expanded
1.6 Custom Adaptive Layout
1.7 responsive_builder Package
1.8 flutter_screenutil Package
1.9 Comparison: Which Approach When?
1.1 What is Responsive Design?
Responsive Design is the process of adapting an application's UI to different:

Screen sizes
Device types
Orientations
Pixel densities
A layout that looks perfect on a phone may become unusable on a tablet, desktop, or web browser if it is not responsive.

Why Does It Matter?
Modern users access applications from:

Mobile Phones
Tablets
Laptops
Desktop Computers
Foldables
Web Browsers
Without responsive design:

Text may overflow
Buttons may become too small
Content may be wasted on large screens
UI may break completely
Learning Roadmap
MediaQuery
    ↓
LayoutBuilder
    ↓
OrientationBuilder
    ↓
Expanded & Flexible
    ↓
Custom Adaptive Layout
    ↓
responsive_builder
    ↓
flutter_screenutil
1.2 MediaQuery
MediaQuery provides information about the current screen.

It allows us to read the device dimensions and make layout decisions based on the available size.

Basic Usage
final size = MediaQuery.sizeOf(context);

final width = size.width;
final height = size.height;
Example From This Project
final crossAxisCount = width > 900
    ? 4
    : width > 600
        ? 3
        : 2;
Breakpoints Used
Width	Columns
< 600	2
600 → 900	3
> 900	4
What We Built
ScreenInfoCard
Displays:

Screen Width
Screen Height
Number of Columns
AdaptiveGrid
Automatically changes:

Phone → 2 Columns

Tablet → 3 Columns

Desktop → 4 Columns
Common Mistake
❌ Avoid using MediaQuery inside initState().

@override
void initState() {
  final width = MediaQuery.of(context).size.width;
}
✅ Use it inside build methods.

@override
Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
}
Key Points
Great for screen-level decisions
Very simple to use
Direct access to screen information
Less suitable for reusable widgets
1.3 LayoutBuilder
LayoutBuilder allows widgets to adapt according to the available space provided by their parent widget.

Unlike MediaQuery, it doesn't care about screen size.

It only cares about:

How much space is available here?
Smart Product Card Example
In this project we created a responsive product card.

LayoutBuilder(
  builder: (context, constraints) {

    if (constraints.maxWidth > 400) {
      return _buildHorizontalLayout();
    }

    return _buildVerticalLayout();
  },
)
Vertical Layout
Used when space is limited.

┌─────────────────┐
│                 │
│     Photo       │
│                 │
├─────────────────┤
│ Product Details │
└─────────────────┘
Horizontal Layout
Used when more width becomes available.

┌─────────┬────────────────┐
│         │                │
│ Image   │ Product Info   │
│         │                │
└─────────┴────────────────┘
Product Card Features
Product
Wireless Headphones
Details
Product Image
Product Description
Product Price
Add To Cart Button
Why LayoutBuilder?
The card can be used:

In a Row
Inside a Grid
On Desktop
On Mobile
Without checking screen size directly.

Key Points
✅ Parent-based adaptation

✅ Better for reusable widgets

✅ More flexible than MediaQuery

✅ Great for cards and components

1.4 OrientationBuilder
OrientationBuilder rebuilds the UI whenever the orientation changes.

Portrait vs Landscape
Portrait
Height > Width
Landscape
Width > Height
Basic Example
OrientationBuilder(
  builder: (context, orientation) {

    if (orientation ==
        Orientation.portrait) {
      return PortraitLayout();
    }

    return LandscapeLayout();
  },
)
Video Player Example
We built a responsive video screen.

Portrait Layout
┌───────────────┐
│ Video Player  │
└───────────────┘

┌───────────────┐
│ Video List    │
└───────────────┘
Landscape Layout
┌─────────┬──────────────┐
│ Video   │              │
│ Player  │ Video List   │
│         │              │
└─────────┴──────────────┘
Components Built
VideoPlayerWidget
Contains:

Play Button
Progress Bar
Duration Information
Video Controls
VideoListWidget
Contains:

Thumbnail
Title
Channel Info
Views
Duration
Result
Creates a YouTube-like adaptive experience.

Key Points
✅ Perfect for media screens

✅ Easy to implement

✅ Better experience in landscape mode

1.5 Flexible & Expanded
Flexible and Expanded help distribute available space proportionally.

Expanded
Expanded forces its child to fill available space.

Example
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(),
    ),

    Expanded(
      flex: 1,
      child: Container(),
    ),
  ],
)
Result
██████████████████ 66%

██████████ 33%
Use Cases
Layout Sections
Dashboards
Profile Cards
Forms
Flexible
Flexible allows its child to be smaller than the available space.

Example
Flexible(
  child: Container(
    width: 100,
  ),
)
Difference
Widget	Behavior
Expanded	Must fill available space
Flexible	Can be smaller
Practical Example
Responsive Profile Card
Contains:

Avatar
User Information
Follow Button
Implementation
Row(
  children: [

    CircleAvatar(),

    Expanded(
      child: UserInfo(),
    ),

    ElevatedButton(),
  ],
)
Key Points
✅ Expanded = fill space

✅ Flexible = optional space

✅ flex controls size ratio

1.6 Custom Adaptive Layout
Instead of repeating breakpoint logic throughout the entire project, we created our own reusable adaptive widget.

AdaptiveLayout Widget
class AdaptiveLayout extends StatelessWidget {

  static const double tabletBreakpoint = 600;

  static const double desktopBreakpoint = 900;

}
Breakpoints
Mobile
width < 600
Tablet
600 ≤ width < 900
Desktop
width ≥ 900
Core Logic
if (width >= desktopBreakpoint &&
    desktop != null) {

  return desktop!;

} else if (
    width >= tabletBreakpoint &&
    tablet != null) {

  return tablet!;
}

return mobile;
Helper Methods
AdaptiveLayout.isMobile(context);

AdaptiveLayout.isTablet(context);

AdaptiveLayout.isDesktop(context);
Movie Detailsformation

---

## Components

### MoviePoster

Displays:

- Poster Artwork
- Movie Icon

---

### MovieInfo

Displays:

- Movie Title
- Rating
- Categories
- Description
- Watch Trailer Button

---

## Benefits

✅ Reusable throughout the project

✅ Centralized breakpoints

✅ Easier maintenance

✅ Cleaner code

---

# 1.7 responsive_builder Package

The responsive_builder package provides ready-made responsive widgets.

---

## Installation

```yaml
dependencies:
  responsive_builder: ^0.7.1
Example
ScreenTypeLayout.builder(
  mobile: (_) => MobileLayout(),
  tablet: (_) => TabletLayout(),
  desktop: (_) => DesktopLayout(),
)
What We Built
Three different layouts:

Mobile
📱 Mobile Layout
Single-column content.

Tablet
📱 Tablet Layout
More spacing and better content distribution.

Desktop
🖥 Desktop Layout
Supports multi-column layouts and navigation side panels.

Benefits
✅ Less code

✅ Built-in breakpoints

✅ Easy to use

✅ Production ready

1.8 flutter_screenutil Package
flutter_screenutil allows us to build UIs based on one design size.

Installation
dependencies:
  flutter_screenutil: ^5.9.3
Initialization
ScreenUtilInit(
  designSize: Size(375, 812),
)
Useful Extensions
Extension	Purpose
.w	Width Scaling
.h	Height Scaling
.r	Radius Scaling
.sp	Font Size Scaling
Example
padding: EdgeInsets.all(16.w)

fontSize: 18.sp

borderRadius:
BorderRadius.circular(12.r)
What We Built
Responsive Header
Scaled Typography
Responsive Radius
Responsive Padding
Responsive Cards
Every card uses:

.w
.h
.r
.sp
to adapt automatically.

Benefits
✅ Consistent scaling

✅ Better typography

✅ Responsive spacing

✅ Responsive radius values

✅ Easier implementation

1.9 Comparison: Which Approach When?
Technique	Best Use Case
MediaQuery	Read screen information
LayoutBuilder	Parent constraints
OrientationBuilder	Orientation changes
Expanded	Fill remaining space
Flexible	Use available space if needed
AdaptiveLayout	Custom breakpoints
responsive_builder	Ready-made layouts
flutter_screenutil	UI scaling
🎯 What We Learned
After completing this skill, we learned:

Reading screen dimensions with MediaQuery
Building adaptive widgets using LayoutBuilder
Detecting orientation changes
Using Flexible and Expanded correctly
Creating reusable adaptive layouts
Using responsive_builder package
Using flutter_screenutil package
Building layouts for Mobile, Tablet, Desktop, and Web
