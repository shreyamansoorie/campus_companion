class Subject {
    string name;
    int rollNumber;
    int attended;
    int missed;
    int total;

    Student({ required this.rollNumber, required this.name, this.attended = 0, this.missed = 0,});

    int get total => attended + missed;

    double get percentage => total == 0 ? 0 : attended * 100 / total;

    int get canSkip => (4*attended) ~/3 - total;

    int get mustAttend => 3*tital - 4*attended;

}