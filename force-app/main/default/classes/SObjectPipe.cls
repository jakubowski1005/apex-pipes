public with sharing class SObjectPipe extends Pipe {
    private List<SObject> records;
    private Map<Id, SObject> oldRecordMap;

    private SObjectPipe(List<SObject> records, Map<Id, SObject> oldRecordMap) {
        super(records);
        this.oldRecords = oldRecords;
    }

    public static of(List<SObject> records, Map<Id, SObject> oldRecordMap) {
        return new SObjectPipe(records, oldRecordMap);
    }

    public static of(List<SObject> records, List<SObject> oldRecords) {
        Map<Id, SObject> oldRecordMap = new Map<Id, SObject>(oldRecords);
        return new SObjectPipe(records, oldRecordMap);
    }

    public static of(Map<Id, SObject> newRecordMap, Map<Id, SObject> oldRecordMap) {
        Map<Id, SObject> oldRecordMap = new Map<Id, SObject>(oldRecords);
        return new SObjectPipe(newRecordMap.values(), oldRecordMap);
    }

    public static of(Map<Id, SObject> newRecordMap, List<SObject> oldRecords) {
        Map<Id, SObject> oldRecordMap = new Map<Id, SObject>(oldRecords);
        return new SObjectPipe(newRecordMap.values(), oldRecordMap);
    }

    public static of(Map<Id, SObject> newRecordMap) {
        return super.of(newRecordMap.values());
    }

    class TestFilter extends Validator {
        public Boolean check(Object param) {
            // param -> List<FilterEntity>
            for (FilterEntity filterEntity : filterEntities) {
                if (filterEntity.test())
            }
        }
    }

    public SObjectPipe findRecords() {
        return this;
    }

    public SObjectPipe whereField(String fieldName) {
        return this;
    }

    public SObjectPipe andAlso() {
        return this;
    }

    public SObjectPipe isEqual() {
        return this;
    }

    public SObjectPipe isEqualTo(Object value) {
        return this;
    }

    public SObjectPipe isChanged() {
        return this;
    }

    public SObjectPipe isChangeTo(Object value) {

    }

    public SObjectPipe isNotChanged() {
        return this;
    }

    public SObjectPipe isNotChangeTo(Object value) {
        return this;
    }

    public SObjectPipe isGreater(Object value) {
        return this;
    }

    public SObjectPipe isGreaterEqual(Object value) {
        return this;
    }

    public SObjectPipe isLower(Object value) {
        return this;
    }

    public SObjectPipe isLowerEqual(Object value) {
        return this;
    }

    public SObjectPipe isEmpty() {
        return this;
    }

    public SObjectPipe isBefore(Date value) {
        return this;
    }

    public SObjectPipe isBefore(Datetime value) {
        return this;
    }

    public SObjectPipe isAfter(Date value) {
        return this;
    }

    public SObjectPipe isAfter(Datetime value) {
        return this;
    }

    // collectors
    public List<SObject> collectAsList() {
        return null;
    }

    public Set<SObject> collectAsSet() {
        return null;
    }

    public Map<Id, SObject> collectAsMap() {

    }

    public Map<Id, Object> collectAsFieldValueMap(String fieldName) {
        return null;
    }

    public Set<Id> collectIds() {
        return null;
    }

    // actions

    public void updateRecords() {
        return;
    }

    public void publishEvents() {
        return;
    }



    /////

    private SObjectPipe changed(Boolean , Object targetValue)

}
