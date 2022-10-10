@IsTest
private class FunctionInterfacesTest {
    @IsTest
    static void testFunction() {
        Decimal result = multiplyByTen(2);
        System.assertEquals(20, result, 'Result must be equal 20');
    }

    @IsTest
    static void testBiFunction() {
        Decimal result = sumTwoNumber(10, 4);
        System.assertEquals(14, result, 'Result must be equal 14');
    }

    @IsTest
    static void testValidatorFunction() {
        Boolean result = isNegativeNumber(-6);
        System.assertEquals(true, result, 'Result must be true');
    }

    @IsTest
    static void testProviderAndConsumers() {
        Account acc = createNewAccount();
        System.assertEquals('Mango', acc.name, 'Account name must be eqaul to Mango');

        updateAccountName(acc);
        System.assertEquals('Orange', acc.name, 'Account name must be eqaul to Orange');

        updateAccountNameToApple(acc);
        System.assertEquals('Apple', acc.name, 'Account name must be eqaul to Apple');
    }

    static Decimal multiplyByTen(Decimal num) {
        return (Decimal) new FunctionInterfacesTest.MultiplyByTen().call(num);
    }

    static Decimal sumTwoNumber(Decimal num1, Decimal num2) {
        return (Decimal) new FunctionInterfacesTest.SumTwoNumbers().call(num1, num2);
    }

    static Boolean isNegativeNumber(Decimal num) {
        return new FunctionInterfacesTest.IsNegativeNumber().check(num);
    }

    static Account createNewAccount() {
        return (Account) new FunctionInterfacesTest.CreateNewAccount().get();
    }

    static void updateAccountName(Account acc) {
        new FunctionInterfacesTest.UpdateAccountName().put(acc);
    }

    static void updateAccountNameToApple(Account acc) {
        new FunctionInterfacesTest.UpdateAccountNameTo().put(acc, 'Apple');
    }

    class MultiplyByTen implements Function {
        public Object call(Object param) {
            return (Decimal) param * 10;
        }
    }

    class SumTwoNumbers implements BiFunction {
        public Object call(Object param1, Object param2) {
            return (Decimal) param1 + (Decimal) param2;
        }
    }

    class IsNegativeNumber implements Validator {
        public Boolean check(Object num) {
            return (Decimal) num < 0;
        }
    }

    class CreateNewAccount implements Provider {
        public Object get() {
            return new Account(Name = 'Mango');
        }
    }

    class UpdateAccountName implements Consumer {
        public void put(Object param) {
            Account acc = (Account) param;
            acc.name = 'Orange';
        }
    }

    class UpdateAccountNameTo implements BiConsumer {
        public void put(Object param1, Object param2) {
            Account acc = (Account) param1;
            acc.name = (String) param2;
        }
    }
}
