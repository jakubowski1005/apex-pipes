@IsTest
private class DummyTest {
   
    @IsTest
    static void test() {
        System.assert(true);
    }

    @IsTest
    static void test2() {
        System.assert(2==2);
    }
}
