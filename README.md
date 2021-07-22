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





## Widgets的状态
### 无状态的Widget:
#### 大部分 widget 都没有需要变更的状态：它们并不包含随时变化的属性（例如图标或者标签）。这些 widget 会继承 StatelessWidget。
        
### 有状态的Widget
#### 当 widget 拥有需要根据用户交互或其他因素而变化的特有属性，它就是 有状态的。这些 widget 会继承 StatefulWidget，
#### 并且「可变的」状态会保存在继承 State 的另一个子类中。StatefulWidget 自身没有 build 方法，而在其对应的 State 对象中。
#### 每当你更改 State 对象时（例如计数增加），你需要调用 setState() 来告知框架，再次调用 State 的构建方法来更新 UI。
 
