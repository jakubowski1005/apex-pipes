@IsTest
private class DummyTest {
   
    @IsTest
    static void test() {
        System.assert(true);
    }

    @IsTest
    static void test11() {
        System.assert(2 == 2);
    }
}
