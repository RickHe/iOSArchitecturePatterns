# iOSArchitecturePatterns
参考
[iOS 架构模式 - 简述 MVC, MVP, MVVM 和 VIPER (译)](https://blog.coding.net/blog/ios-architecture-patterns)

* MVC
    * Models 数据层，负责处理数据的数据接口层
    * Views 展示层，UI
    * Controller 中间层，负责Models和Views的连接，用户更新UI时负责数据的update，当数据update负责UI的update!
    * 这种模式缺点Controller太重，影响单元测试，Controller和View紧密偶尔，需要频繁mock View！
    * 优点简单快速上手
* MVP
    * Model：数据，或者数据接口
    * Passive View, UIView或者UIViewController
    * Presenter，将MVC中Controller的事情移到这层，由于该层无布局代码，也不需要关注生命周期，职责只是创建数据，更新View，比较好测试
    * 必须手动去创建数据绑定事件，将大部分职责分配到了presenter里面，View和Model事情不多
* MVVM
    * Model：数据，或者数据接口
    * View： UIView或者UIViewController
    * ViewModel：类似于Presenter层，但是和MVP模式不同的是，ViewModel做的事情比presenter少，ViewModel负责数据绑定，更新还是要View自己去做，而MVP模式都交给presenter
* VIPER
    * View UIView或者UIViewController
    * Interactor 负责数据的接口，数据的获取，数据的网络请求等
    * Presenter 展示器包括UI的显示更新
    * Entities 数据实体类
    * Router路由 负责转场
    
采取什么模式，看需求！能用MVC尽量用MVC，简单！
MVC不满足需求时，考虑MVP，MVVM，VIPER！
可以混合使用！
