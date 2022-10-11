@IsTest
private class PipeTest {
    @IsTest
    static void testMultiElementPipeCreation() {
        Integer[] numbers = new Integer[] { 1, 2, 3 };
        IPipe pipe = Pipe.of(numbers);
        System.assertEquals(3, pipe.size(), 'Pipe should have three elements');
    }

    @IsTest
    static void testSingleElementPipeCreation() {
        Integer num = 0;
        IPipe pipe = Pipe.of(num);
        System.assertEquals(1, pipe.size(), 'Pipe should have one element');
    }
}
