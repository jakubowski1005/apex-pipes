@IsTest
private class PipeTest {
    @IsTest
    static void testMultiElementPipeCreation() {
        List<Integer> numbers = new List<Integer> { 1, 2, 3 };
        IPipe pipe = Pipe.of(numbers);
        System.assertEquals(3, pipe.size(), 'Should have three elements');
    }

    @IsTest
    static void testSingleElementPipeCreation() {
        Integer num = 0;
        IPipe pipe = Pipe.of(num);
        System.assertEquals(1, pipe.size(), 'Should have one element');
    }

    @IsTest
    static void testFlatFunction() {
        List<Object> numberLists = new List<List<Integer>>();
        numberLists.add(new List<Integer> { 1, 2 });
        numberLists.add(new List<Integer> { 3, 4 });

        List<Object> result = Pipe.of(numberLists)
            .flat()
            .collectAsList();

        List<Integer> expected = new List<Integer> { 1, 2, 3, 4 };
        System.assertEquals(expected, result, 'Should flatten provided arrays');
    }

    @IsTest
    static void testTransformFunction() {
        List<Integer> numbers = new List<Integer> { 1, 2, 3 };
        
        List<Object> result = Pipe.of(numbers)
        .transform(multiplyByTen())
        .collectAsList();
        
        List<Integer> expected = new List<Integer> { 10, 20, 30 };
        System.assertEquals(expected, result, 'Should multiply each element by ten');
    }

    @IsTest
    static void testFlatTransform() {
        List<Object> numberLists = new List<List<Integer>>();
        numberLists.add(new List<Integer> { 1, 2 });
        numberLists.add(new List<Integer> { 3, 4 });

        List<Object> result = Pipe.of(numberLists)
            .flatTransform(multiplyByTen())
            .collectAsList();

        List<Integer> expected = new List<Integer> { 10, 20, 30, 40 };
        System.assertEquals(expected, result, 'Should multiply each element by ten and then flatten provided arrays');
    }

    @IsTest
    static void testFilter() {
        List<Integer> numbers = new List<Integer> { 1, 2, 3, 4 };
        
        List<Object> result = Pipe.of(numbers)
        .filter(isEvenNumber())
        .collectAsList();
        
        List<Integer> expected = new List<Integer> { 2, 4 };
        System.assertEquals(expected, result, 'Should contain only even numbers');
    }

    @IsTest
    static void testReduce() {
        List<Integer> numbers = new List<Integer> { 1, 2, 3, 4 };
        
        Integer result = (Integer) Pipe.of(numbers)
        .reduce(sumTwoNumbers())
        .collectAsList()[0];
        
        Integer expected = 10;
        System.assertEquals(expected, result, 'Should add up to ten');
    }

    @IsTest
    static void testSort() {
        List<Integer> numbers = new List<Integer> { 2, 1, 3, 4 };
        
        List<Object> result = Pipe.of(numbers)
        .sort(sortNumbers())
        .collectAsList();
        
        List<Integer> expected = new List<Integer> { 1, 2, 3, 4 };
        System.assertEquals(expected, result, 'Should sort numbers');
    }

    @IsTest
    static void testForEachConsumer() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First'),
            new Account(Name = 'Second'),
            new Account(Name = 'Third')
        };

        Pipe.of(accounts).forEach(updateAccountNames());

        System.assertEquals(accounts[0].Name, 'First2', 'Should update account name');
        System.assertEquals(accounts[1].Name, 'Second2', 'Should update account name');
        System.assertEquals(accounts[2].Name, 'Third2', 'Should update account name');
    }

    @IsTest
    static void testForEachBiConsumer() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First'),
            new Account(Name = 'Second'),
            new Account(Name = 'Third')
        };

        Pipe.of(accounts).forEach(updateAccountNamesTo(), 'Test');

        System.assertEquals(accounts[0].Name, 'Test', 'Should update account name');
        System.assertEquals(accounts[1].Name, 'Test', 'Should update account name');
        System.assertEquals(accounts[2].Name, 'Test', 'Should update account name');
    }

    @IsTest
    static void testFind() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First', Description = '1'),
            new Account(Name = 'Second', Description = '2'),
            new Account(Name = 'Second', Description = '3')
        };

        Account result = (Account) Pipe.of(accounts).find(findSecondAccount());

        System.assertEquals(result.Description, '2', 'Should find first matching account');
    }

    @IsTest
    static void testFindLast() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First', Description = '1'),
            new Account(Name = 'Second', Description = '2'),
            new Account(Name = 'Second', Description = '3')
        };

        Account result = (Account) Pipe.of(accounts).findLast(findSecondAccount());

        System.assertEquals(result.Description, '3', 'Should find last matching account');
    }

    @IsTest
    static void testFindIndex() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First', Description = '1'),
            new Account(Name = 'Second', Description = '2'),
            new Account(Name = 'Second', Description = '3')
        };

        Integer result = (Integer) Pipe.of(accounts).findIndex(findSecondAccount());

        System.assertEquals(result, 1, 'Should find index of the first matching account');
    }

    @IsTest
    static void testFindLastIndex() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First', Description = '1'),
            new Account(Name = 'Second', Description = '2'),
            new Account(Name = 'Second', Description = '3')
        };

        Integer result = (Integer) Pipe.of(accounts).findLastIndex(findSecondAccount());

        System.assertEquals(result, 2, 'Should find index of the last matching account'); 
    }

    @IsTest
    static void testEveryTrue() {
        List<Integer> numbers = new List<Integer> { 10, 20, 30, 40 };
        
        Boolean result = (Boolean) Pipe.of(numbers).every(isDividedByTen());
        
        System.assertEquals(true, result, 'Should check if all numbers are divided by 10');
    }

    @IsTest
    static void testEveryFalse() {
        List<Integer> numbers = new List<Integer> { 10, 20, 3, 40 };
        
        Boolean result = (Boolean) Pipe.of(numbers).every(isDividedByTen());
        
        System.assertEquals(false, result, 'Should check if all numbers are divided by 10'); 
    }

    @IsTest
    static void testAnyTrue() {
        List<Integer> numbers = new List<Integer> { 1, 20, 3, 4 };
        
        Boolean result = (Boolean) Pipe.of(numbers).any(isDividedByTen());
        
        System.assertEquals(true, result, 'Should check if any number is divided by 10');
    }

    @IsTest
    static void testAnyFalse() {
        List<Integer> numbers = new List<Integer> { 1, 2, 3, 4 };
        
        Boolean result = (Boolean) Pipe.of(numbers).any(isDividedByTen());
        
        System.assertEquals(false, result, 'Should check if any number is divided by 10');
    }

    @IsTest
    static void testGroupFunction() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First', Type = 'Company'),
            new Account(Name = 'Second', Type = 'Private'),
            new Account(Name = 'Third', Type = 'Company')
        };

        Map<Object, List<Object>> result = Pipe.of(accounts).group(groupByType());

        System.assertEquals(result.get('Company').size(), 2, 'Should have two company accounts'); 
        System.assertEquals(result.get('Private').size(), 1, 'Should have two company accounts'); 
    }

    @IsTest
    static void testGroupBiFunction() {
        List<Account> accounts = new List<Account> { 
            new Account(Name = 'First', Type = 'Company'),
            new Account(Name = 'Second', Type = 'Private'),
            new Account(Name = 'Third', Type = 'Company')
        };

        Map<Object, List<Object>> result = Pipe.of(accounts).group(groupByField(), 'Type');

        System.assertEquals(result.get('Company').size(), 2, 'Should have two company accounts'); 
        System.assertEquals(result.get('Private').size(), 1, 'Should have two company accounts'); 
    }

    @IsTest
    static void testIsEmpty() {
        List<Integer> numbers = new List<Integer> { };
        
        Boolean result = (Boolean) Pipe.of(numbers).isEmpty();
        
        System.assertEquals(true, result, 'Should check if pipe is empty');
    }

    static Function multiplyByTen() {
        return new MultiplyByTen();
    }

    static Validator isEvenNumber() {
        return new IsEvenNumber();
    }

    static BiFunction sumTwoNumbers() {
        return new SumTwoNumbers();
    }

    static BiFunction sortNumbers() {
        return new SortNumbers();
    }

    static Consumer updateAccountNames() {
        return new UpdateAccountName();
    }

    static BiConsumer updateAccountNamesTo() {
        return new UpdateAccountNameTo();
    }

    static Validator findSecondAccount() {
        return new FindSecondAccount();
    }

    static Validator isDividedByTen() {
        return new IsDividedByTen();
    }

    static Function groupByType() {
        return new GroupByType();
    }

    static BiFunction groupByField() {
        return new GroupByField();
    }

    class MultiplyByTen implements Function {
        public Object call(Object param) {
            return (Integer) param * 10;
        }
    }

    class IsEvenNumber implements Validator {
        public Boolean check(Object param) {
            return Math.mod((Integer) param, 2) == 0;
        }
    }

    class SumTwoNumbers implements BiFunction {
        public Object call(Object param1, Object param2) {
            return (Integer) param1 + (Integer) param2;
        }
    }

    class SortNumbers implements BiFunction {
        public Object call(Object param1, Object param2) {
            if ((Integer) param1 == (Integer) param2) {
                return 0;
            }
            if ((Integer) param1 > (Integer) param2) {
                return 1;
            }
            return -1;
        }
    }

    class UpdateAccountName implements Consumer {
        public void put(Object param) {
            Account acc = (Account) param;
            acc.Name = acc.Name + '2';
        }
    }

    class UpdateAccountNameTo implements BiConsumer {
        public void put(Object param1, Object param2) {
            Account acc = (Account) param1;
            acc.Name = (String) param2;
        }
    }

    class FindSecondAccount implements Validator {
        public Boolean check(Object param) {
            Account acc = (Account) param;
            return acc.Name == 'Second';
        }
    }

    class IsDividedByTen implements Validator {
        public Boolean check(Object param) {
            return Math.mod((Integer) param, 10) == 0;
        }
    }

    class GroupByType implements Function {
        public Object call(Object param) {
            Account acc = (Account) param;
            String field = 'Type';
            return acc.get('Type');
        }
    }

    class GroupByField implements BiFunction {
        public Object call(Object param1, Object param2) {
            Account acc = (Account) param1;
            String field = (String) param2;
            return acc.get(field);
        }
    }
}
