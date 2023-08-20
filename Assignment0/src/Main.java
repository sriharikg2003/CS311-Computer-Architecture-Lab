
public class Main {
    public static void main(String[] args) {

       
        int w = 100;
        int l = 1000;
        double p = 0.9;

        System.out.println(w);
        Border rectangle = new Border(w);

        Time t = new Time();
        t.waqt = 1;

        // Inflitrator

        Infiltrator inf = new Infiltrator();
        inf.pos[0] = -1;
        inf.pos[1] = -1;

        for (int i = 0; i <= 100; i++, t.waqt++) {
            if (t.waqt % 10 == 0) {
                

                for (int j = 0; j < w; j++) {
                    for (int k = 0; k < l; k++) {
                        double rand = Math.random();

                        if (rand > p)
                            rectangle.mymatrix[j][k].sensorWorking = true;
                        else
                            rectangle.mymatrix[j][k].sensorWorking = false;
                    }
                }

                if(!inf.move(rectangle)){
                    break;
                }
            }
        }
    }
}