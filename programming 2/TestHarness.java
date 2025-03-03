public class TestHarness {
	static Week6Functions functions;

	/*
	 *  You do not need to modify any of the code in this class. 
	 *  You will be working in the Week6Functions class, implementing the
	 *  functions based on the comments.
	 */
	
	public static void main(String args[]) {
		functions = new Week6Functions(); // create an object of Week6Functions
		
		testAverage(); // test the average function in Week6Functions class
		testRange(); // test the range function in Week6Functions class
		testCollatz(); // test the collatz function in Week6Functions class
		testCompoundInterest(); // test the compoundInterest function in Week6Functions class
	}
	

	static void testAverage() {
		// this method contains test cases to test the average function from the Week6Functions class
		int[][] input = { {}, { 1, 2 }, { 0, 0, 0 }, { 5, 5, 5, 5, 5, 6 }, { 1, 2, 3, 4 } };
		int[] output = { 0, 1, 0, 5, 2 };
		int numTestCases = input.length;
		System.out.println("***********\nTesting average method ");
		int passed = 0;
		for (int i = 0; i < numTestCases; i++) {
			int result = functions.average(input[i]);
			if (result != output[i]) {
				System.out.println("Test " + i + " failed. Expected " + output[i] + " got " + result);
			} else {
				passed++;
				System.out.println("Test " + i + " passed!");
			}
		}
		System.out.println("Finished testing Average - passed " + passed + " out of " + numTestCases);
	}

	static void testRange() {
		// array below is a two-dimensional array - an array that contains arrays
		float[][] input = { {}, { 1.0f }, { 2.0f, 2.0f }, { -1000.0f, 0.0f }, { 1000.0f, -1000.0f, 2.0f, 5.0f },
				{ -1000.0f, -999.9f }, { 1000.0f } };
		float[] output = { 0.0f, 0.0f, 0.0f, 1000.0f - 0.0f, 1000.0f + 1000.0f, -999.9f + 1000.0f, 0.0f };
		int numTestCases = input.length;
		System.out.println("***********\nTesting range method ");
		int passed = 0;
		for (int i = 0; i < numTestCases; i++) {
			float result = functions.range(input[i]);
			if (result != output[i]) {
				System.out.println("Test " + i + " failed. Expected " + output[i] + " got " + result);
			} else {
				passed++;
				System.out.println("Test " + i + " passed!");
			}
		}
		System.out.println("Finished testing Range - passed " + passed + " out of " + numTestCases);
	}

	static void testCollatz() {
		int[] input = { 0, 1, 2, 10, 11 };
		int[] output = { 0, 4, 1, 5, 34 };
		int numTestCases = input.length;
		System.out.println("***********\nTesting collatz method ");
		int passed = 0;
		for (int i = 0; i < numTestCases; i++) {
			int result = functions.collatz(input[i]);
			if (result != output[i]) {
				System.out.println("Test " + i + " failed. Expected " + output[i] + " got " + result);
			} else {
				passed++;
				System.out.println("Test " + i + " passed!");
			}
		}
		System.out.println("Finished testing Collatz - passed " + passed + " out of " + numTestCases);
	}

	static void testCompoundInterest() {
		int[] capital = { 0, 5000, 10000, 10000, 0 };
		int[] ratePC = { 0, 1, 5, 1, 5 };
		int[] years = { 0, 10, 10, 0, 10 };
		int[] output = { 0, 5523, 16289, 10000, 0 };

		int numTestCases = capital.length;
		System.out.println("***********\nTesting compoundInterest method ");
		int passed = 0;
		for (int i = 0; i < numTestCases; i++) {
			int result = functions.compoundInterest(capital[i], ratePC[i], years[i]);
			if (result != output[i]) {
				System.out.println("Test " + i + " failed. Expected " + output[i] + " got " + result);
			} else {
				passed++;
				System.out.println("Test " + i + " passed!");
			}
		}
		System.out.println("Finished testing CompoundInterest - passed " + passed + " out of " + numTestCases);
	}

}
