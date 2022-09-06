# startup_namer

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Flutter架构概览

### 嵌入层【最底层】
#### 提供一个程序入口，程序由此可以跟底层的操作系统进行协调。Flutter 代码可以通过嵌入层，以模块方式集成到现有的应用中，也可以作为应用的主体。

### Flutter引擎【中间层】
#### 提供了Flutter核心API的底层实现，包括图形、文本布局、文件及网络 IO、辅助功能支持、插件架构和 Dart 运行环境及编译环境的工具链。
#### 引擎将底层 C++ 代码包装成 Dart 代码，通过 dart:ui 暴露给 Flutter 框架层。该库暴露了最底层的原语，包括用于驱动输入、图形、和文本渲染的子系统的类。

### Flutter框架层【最上层】
#### 1、基础的 foundational 类及一些基层之上的构建块服务，如 animation、 painting 和 gestures，它们可以提供上层常用的抽象。
#### 2、渲染层 用于提供操作布局的抽象。有了渲染层，你可以构建一棵可渲染对象的树。在你动态更新这些对象时，渲染树也会自动根据你的变更来更新布局。
#### 3、widgets层 是一种组合的抽象。每一个渲染层中的渲染对象，都在 widgets 层中有一个对应的类。此外，widgets 层让你可以自由组合你需要复用的各种类。响应式编程模型就在该层级中被引入。
#### 4、Material 和 Cupertino 库提供了全面的 widgets 层的原语组合，这套组合分别实现了 Material 和 iOS 设计规范。




### Widgets的状态
#### 无状态的Widget:
##### 大部分 widget 都没有需要变更的状态：它们并不包含随时变化的属性（例如图标或者标签）。这些 widget 会继承 StatelessWidget。
        
#### 有状态的Widget
##### 当 widget 拥有需要根据用户交互或其他因素而变化的特有属性，它就是 有状态的。这些 widget 会继承 StatefulWidget，
##### 并且「可变的」状态会保存在继承 State 的另一个子类中。StatefulWidget 自身没有 build 方法，而在其对应的 State 对象中。
##### 每当你更改 State 对象时（例如计数增加），你需要调用 setState() 来告知框架，再次调用 State 的构建方法来更新 UI。
 



### 渲染机制
#### 通常来说---跨平台框架都会在Android和iOS的UI底层库上创建一层抽象，该抽象层试图抹平各个系统的差异。
#### 这时应用程序的代码常常使用解释型语言来进行编写，这些代码会与基于 Java 的 Android 和基于 Objective-C 的 iOS 系统进行交互，最终显示 UI 界面。
#### 所有的流程都增加了显著的开销，在 UI 和应用逻辑有繁杂的交互时更为如此。

#### 相比之下Flutter---通过绕过系统组件库，使用自己的Widget内容集，削减了内容层的开销。用于绘制 Flutter 图像内容的 Dart 代码被编译为机器码，并使用 Skia 进行渲染。




### Flutter应用中渲染原生内容
#### 由于Flutter的内容绘制在单一的纹理内，并且 widget 树是完全在内部的，因此在 Flutter 的内部模型中无法存在 Android 视图之类的内容，
#### 也无法与 Flutter 的 widget 交错渲染，对于需要在 Flutter 应用中展示原生组件（例如内置浏览器）的开发者来说，这是一个问题。

#### Flutter平台通过了平台 widget 【AndroidView/UiKitView】解决了这个问题，开发者可以在每一种平台上嵌入此类内容。
#### 平台视图可以与其他的 Flutter 内容集成。这些 widget 充当了底层操作系统与 Flutter 之间的桥梁。











## Flutter工作原理

### 积极可组合性：
#### 组合性是Flutter最出众的一个特性。widget 通过组合其他 widget 的方式进行构建，并且这些 widget 自身由更基础的 widget 构建。
#### widget 递归构建的底层是 RenderObjectWidget，它将在渲染树的底部创建子节点。渲染树是一种存储用户界面几何信息的数据结构，
#### 该几何信息在 布局 期间计算并在 绘制 及 命中测试 期间使用。大多数 Flutter 开发者无需直接创建这些对象，而是使用 widget 来操纵渲染树。


### 次线性布局：
#### Flutter 对每一帧执行一次布局操作，且布局算法仅在一次传递中完成。约束信息通过父节点调用每个子节点的布局方法向下传递。子节点递归执行自身的布局操作，并在它们的布局方法中返回几何信息以便将其添加到渲染树中。
#### 需要注意的是，一旦渲染对象从布局中返回，该对象将不会被再次访问 1，直到下一帧布局的执行。该策略将可能存在的单独测量和布局传递合并为单次传递，因此，每个渲染对象在布局过程中最多被访问两次 2：一次在树的向下传递过程中，一次在树的向上传递过程中。





## Flutter调试

### 如何打断点:
#### 1、正常运行，选取断点。2、点击底部main.dart上蓝色图标【Open Flutter DevTools】3、点击AS顶部工具栏的手机图标【Flutter Attach】，即可进行断点调试。


## Flutter布局【UI】
#### 1、使用PageView控件 实现仿ViewPager的滑动效果。
#### 2、PageView滑动属性【physics】设置：   
####       BouncingScrollPhysics	允许滚动出边界，超过边界时会有回弹效果，会响应滚动事件
####       ClampingScrollPhysics	不允许滚动出边界，会响应滚动事件
####       AlwaysScrollableScrollPhysics	一直响应滚动事件
####       NeverScrollableScrollPhysics	禁止滚动，不响应滚动事件
####       FixedExtentScrollPhysics	ListWheelScrollView滚轮使用时，item都会停止在中间位置，不会停在分割线
####       PageScrollPhysics	PageView滚轮使用时，item都会停止在一页，不会停止在分割线位置
####       RangeMaintainingScrollPhysics	当内容突然改变尺寸时，试图将滚动位置保持在范围内的滚动物理











