package vn.bmag;

/**
 * Created by Notebook on 15-Jul-17.
 */
public class FibonacciUtils {
    public static int[] createFibonacciNumbers(int quantity) {
        int[] results = new int[quantity];
        switch (quantity) {
            case 1:
                results[0] = 1;
                break;
            case 2:
                results[0] = 1;
                results[1] = 1;
                break;
            default:
                results[0] = 1;
                results[1] = 1;
                for (int i = 2; i < quantity; i++) {
                    results[i] = results [i-1] + results[i-2];
                }
        }
        return results;
    }
}
