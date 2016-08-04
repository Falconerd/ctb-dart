import "./energy.dart";
import "./controllable.dart";

class Actor implements Controllable {
  Energy energy = new Energy();
  int energyPerTick;
  String ascii;
  bool hasSomeValue;

  Actor(String ascii, int energyPerTick) {
    this.ascii = ascii;
    this.energyPerTick = energyPerTick;
  }

  update() {
    this.energy.decrease(this.energyPerTick);
  }
}
