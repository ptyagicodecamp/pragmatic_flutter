//Person class
abstract class Person {
  int age;
  int name;

  eat() {}
  sleep() {}
}

//Artist class
class Artist extends Person with Sketching {
  sketchLandscape() {
    sketch("Making landscapes sketches");
  }
}

//Engineer class
class Engineer extends Person with Sketching, Reading {
  sketchBuildings() {
    sketch("Sketching engineering drawings");
  }

  readResearchPaper() {
    String topic = "Building Construction";
    dailyReading(topic);
  }
}

//Doctor class
class Doctor extends Person with Reading, Exercise {
  readReports() {
    String topic = "flu";
    dailyReading(topic);
  }

  workout() {
    running(1);
    weightTraining(10);
  }
}

//Athlete class
class Athlete extends Person with Exercise {
  generalRoutine() {
    running(2);
    weightTraining(20);
  }
}

//Boxer class
class Boxer extends Athlete with Boxing {
  punchPractice() {
    punch(100);
  }

  routineExercise() {
    running(4);
    weightTraining(40);
  }
}

//Mixins

//Sketching mixin
mixin Sketching {
  sketch(String message) {
    print(message);
  }
}

//Reading mixin
mixin Reading {
  dailyReading(String topic) {
    print("Daily reading on ${topic}");
  }
}

//Exercise mixin
mixin Exercise {
  running(int mile) {
    print("Daily run of ${mile} mile(s)");
  }

  weightTraining(int weights) {
    print("Lifting ${weights} lbs");
  }
}

//Boxing
mixin Boxing on Athlete {
  punch(int n) {
    print("Boxer practicing ${n} punches");
  }
}

void main() {
  print("Artist");
  Artist artist = Artist();
  artist.sketchLandscape();

  print("\nEngineer");
  Engineer engineer = Engineer();
  engineer.sketchBuildings();
  engineer.readResearchPaper();

  print("\nDoctor");
  Doctor doctor = Doctor();
  doctor.readReports();
  doctor.workout();

  print("\nBoxer");
  Boxer boxer = Boxer();
  boxer.punchPractice();
  boxer.routineExercise();
}
