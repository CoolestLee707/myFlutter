class Post {

  const Post({
    this.title,
    this.auther,
    this.imageUrl,
    this.description,
  });

  final String title;//final意思是一旦这个变量分配了值，就不能改变了
  final String auther;
  final String imageUrl;
  final String description;
}

final List<Post> posts = [
  Post(
    title: '标题1',
    auther: '作者1',
    imageUrl: 'http://pic22.nipic.com/20120620/9644879_220135570113_2.jpg',
    description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',
  ),
  Post(
    title: '标题2',
    auther: '作者2',
    imageUrl: 'https://b-ssl.duitang.com/uploads/blog/201308/08/20130808131501_LnLhw.jpeg',
    description: 'Flutter是Google开发的新一代跨平台方案，Flutter可以实现写一份代码同时运行在iOS和Android设备上，并且提供很好的性能体验。Flutter使用Dart作为开发语言，这是一门简洁、强类型的编程语言。Flutter对于iOS和Android设备，提供了两套视觉库，可以针对不同的平台有不同的展示效果。Flutter原本是为了解决Web开发中的一些问题，而开发的一套精简版Web框架，拥有独立的渲染引擎和开发语言，但后来逐渐演变为移动端开发框架。正是由于Dart当初的定位是为了替代JS成为Web框架，所以Dart的语法更接近于JS语法。例如定义对象构建方法，以及实例化对象的方式等。在Google刚推出Flutter时，其发展很缓慢，终于在18年发布第一个Bate版之后迎来了爆发性增长，发布第一个Release版时增长速度更快。可以从Github上Star数据看出来这个增长的过程。在19年最新的Flutter 1.2版本中，已经开放Web支持的Beta版。',
  ),
  Post(
    title: '标题3',
    auther: '作者3',
    imageUrl: 'https://b-ssl.duitang.com/uploads/blog/201404/14/20140414152949_BYjee.jpeg',
    description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',

  ),
  Post(
    title: '标题4',
    auther: '作者4',
    imageUrl: 'http://pic19.nipic.com/20120306/1800637_093422765467_2.jpg',
    description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',

  ),
  Post(
    title: '标题5',
    auther: '作者5',
    imageUrl: 'https://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg',
    description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',

  ),
  Post(
    title: '标题6',
    auther: '作者6',
    imageUrl: 'http://pic27.nipic.com/20130324/9252150_174233406000_2.jpg',
    description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',

  ),
  Post(
    title: '标题7',
    auther: '作者7',
    imageUrl: 'https://b-ssl.duitang.com/uploads/item/201208/05/20120805220124_ZChsk.jpeg',
    description: 'Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。',

  ),
];
