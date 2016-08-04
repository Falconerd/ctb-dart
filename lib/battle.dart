import "./actor.dart";

class Battle {
  final actors = <Actor>[];
  int currentActorIndex = 0;
  bool waitingForInput = false;

  Battle(a, b) {
    for (Actor actor in a) {
      actors.add(actor);
    }
    for (Actor actor in b) {
      actors.add(actor);
    }
  }

  void process() {
    Actor actor = actors[this.currentActorIndex];
    if (actor.energy.current <= 0) {
      int remainder = actor.energy.current.abs();
      actor.energy.reset();
      actor.energy.increase(remainder);
      print(actor.ascii + " has a turn.");
      if (actor.ascii == "#") {
        this.waitingForInput = true;
      }
    }

    actor.update();
    this.currentActorIndex = (this.currentActorIndex + 1) % actors.length;
  }
}
