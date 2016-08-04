import "./config.dart" show Config;

class Energy {
  int current = 0;

  Energy() {
    this.current = Config.ENERGY_PER_TURN;
  }

  void increase(amount) {
    this.current += amount;
  }

  void decrease(amount) {
    this.current -= amount;
  }

  void reset() {
    this.current = Config.ENERGY_PER_TURN;
  }
}
