enum LoadingStatus {
  initial,  // 初始化状态
  content,  // 显示内容
  loading, // 加载中
  empty,
  disconnect, // 断网
  error
}

var statusList = LoadingStatus.values;
