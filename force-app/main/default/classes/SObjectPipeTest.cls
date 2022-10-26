@IsTest
private class SObjectPipeTest {
    @IsTest
    static void test() {
        Account[] newAccounts = Account[] { new Account(Name = '1')};
        Account[] oldAccounts = Account[] { new Account(Name = '0')};

        SObjectPipe.of(newAccounts, oldAccounts)
            .findRecords()
            .whereField('Name')
            .isChanged()
            .andAlso()
            .whereField('CreatedDate')
            .isAfter(Date.today().addDays(-3))
            .map(getAccountToInvoiceEventMapper())
            .publishEvents();
    }
}
