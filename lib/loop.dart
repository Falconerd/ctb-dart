class Loop {
  var events = {};
  bool paused = true;
  bool active = false;

  void emit(String type) {
    if (this.events[type] is Function) {
      this.events[type]();
    }
  }

  void on(String type, callback) {
    this.events[type] = callback;
  }

  void start() {
    this.active = true;
    this.paused = false;
    this.emit("start");
    this.tick();
  }

  void tick() {
    while (this.active && !this.paused) {
      this.emit("tick");
    }
  }

  void pause() {
    this.paused = true;
    this.emit("pause");
  }

  void unpause() {
    this.paused = false;
    this.emit("unpause");
    this.tick();
  }

  void stop() {
    this.active = false;
    this.emit("stop");
  }
}
