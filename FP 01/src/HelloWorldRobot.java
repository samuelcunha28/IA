public class HelloWorldRobot extends robocode.Robot {
    @Override
    public void run() {
        while(true) {
            this.ahead(100);
            this.turnRight(90);
        }
    }
}
