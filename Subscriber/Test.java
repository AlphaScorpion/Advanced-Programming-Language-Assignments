public class Test {
    public static void main(String[] args) {
        calcAddress(1200, 0, 0, 2, 2, 1);
		calcAddress(100, 1, 1, 2, 2, 2);
		calcAddress(100, 2, 3, 4, 5, 4);
		calcAddress(100, -1, -1, 1, 2, 8);
    }

    public static void calcAddress(int base, int rowlb, int collb, int rowub, int colub, int elementSize) {
		System.out.println("\nFor array a["+rowlb+":"+rowub+","+collb+":"+colub+"] with element size " +elementSize);

        for (int i = rowlb; i <= rowub; i++) {
            for (int j = collb; j <= colub; j++) {
				int n = colub - collb + 1;
				int x = (((rowlb*n)+(collb))*elementSize);
				int y = (((i*n)+j)*elementSize);
				int location = (base) - (x) + (y);
                System.out.println("a["+i+"]["+j+"] address =" + location);
            }
        }
    }
}