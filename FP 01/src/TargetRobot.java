import robocode.DeathEvent;
import robocode.HitByBulletEvent;
import robocode.HitWallEvent;
import robocode.RobotDeathEvent;

import java.awt.*;

public class TargetRobot extends robocode.Robot {
    String killer;

    @Override
    public void run() {
        setColors(Color.RED, Color.WHITE, Color.BLACK);
    }

    @Override
    public void onHitByBullet(HitByBulletEvent event) {
        killer = event.getBullet().getName();
        System.out.println("Essa doeu! Fui atingido por uma bala! Potencia: " + event.getPower() + "\n" +
                "Posicao: " + event.getBearing() + "relativamente a mim. \n" +
                "Bala disparada por: " + event.getBullet().getName() + "e atingiu-me a uma velocidade de: " + event.getVelocity() + "pixeis\n" +
                "Neste momento tenho: " + this.getEnergy() + " de energia");
        back(100);
    }

    public void onHitWall(HitWallEvent event) {
        System.out.println("Atingi a parede! Vou avançar 400 unidades");
        ahead(400);
    }

    public void onDeath(DeathEvent event) {
        System.out.println("Morri! O " + killer + " matou-me :(");
    }
}
