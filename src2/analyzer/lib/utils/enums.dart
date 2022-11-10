// This can be used for the persistent data instance state
enum AppConfigDataStatus {
  init,
  ready,
  idle,
  busy,
  fail,
}

// This can be used for the rootModel to trace the screen/page state
enum AppStatus {
  splash,
  menu,
  checkout,
  history,
  products,
  configuration,
  devices,
  about,
  close,
}
