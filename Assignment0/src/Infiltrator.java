public class Infiltrator {
    int[] pos = new int[2];

    public boolean move(Border rectangle) {
        if (this.pos[0] == -1 && this.pos[1] == -1) {
           
                this.pos[0] = (int) (rectangle.mymatrix.length / 2);
                this.pos[1] = 0;
                System.out.println("Inflitrator moved to X: " + this.pos[0] + " Y: " + this.pos[1]);
                return true;
            
        }

        else {
            if (rectangle.mymatrix[this.pos[0]][this.pos[1]].sensorWorking) {
                System.out.println("Caught");
                     return false;
            }
            else
            {
                this.pos[0] += 1;
                this.pos[1] += 1;
                System.out.println("Inflitrator moved to X: " + this.pos[0] + " Y: " + this.pos[1]);
                 return true;
            }
        }
    }
}
