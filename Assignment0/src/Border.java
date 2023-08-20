public class Border {
    public int width;
    public int length = 1000;
    Grid[][] mymatrix;

    public Border(int y) {
        width = y;
        mymatrix = new Grid[width][length];

        for (int i = 0; i < width; i++) {
            for (int j = 0; j < length; j++) {
                mymatrix[i][j] = new Grid(i,j);
            }
        }
    }
}
