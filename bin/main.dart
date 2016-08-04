import "dart:io";
import "dart:async";
import "../lib/battle.dart";
import "../lib/actor.dart";
import "../lib/loop.dart";

Actor a = new Actor("#", 4);
Actor b = new Actor("@", 2);
Actor c = new Actor("!", 3);
Actor d = new Actor("%", 4);
Actor e = new Actor("&", 5);
Actor f = new Actor("M", 6);
Actor g = new Actor("P", 7);
Actor h = new Actor("d", 8);

Battle battle = new Battle([a, b, c, d], [e, f, g, h]);

class Game {
  static bool paused = false;
}

Loop loop = new Loop();

void main() {
  loop.on("tick", tick);
  loop.start();
}


void tick() {
  battle.process();
  if (battle.waitingForInput) {
    loop.pause();
    Future<String> waitForInput = new Future(readLine);
    waitForInput.then((content)
    {
      battle.waitingForInput = false;
      loop.unpause();
    });
  }
}

String readLine() {
  String input = stdin.readLineSync();
  return input;
}
