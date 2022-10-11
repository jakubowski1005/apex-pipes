public with sharing class Pipe implements IPipe {
    private List<Object> entities;
    
    private Pipe(List<Object> entities) {
        this.entities = entities;
    }

    public static IPipe of(List<Object> entities) {
        return new Pipe(entities);
    }

    public static IPipe of(Object entity) {
        return new Pipe(new List<Object> { entity });
    }

    public IPipe flat() {
        return this;
    }

    public IPipe transform(Function function) {
        return this;
    }

    public IPipe flatTransform(Function function) {
        return this;
    }
    
    public IPipe filter(Validator validator) {
        return this;
    }
    
    public IPipe reduce(BiFunction biFunction) {
        return this;
    }
    
    public IPipe sort(BiFunction biFunction) {
        return this;
    }
    
    public void forEach(Consumer consumer) {
        return;
    }
    
    public Object find(Validator validator) {
        return null;
    }
    
    public Object findLast(Validator validator) {
        return null;
    }
    
    public Integer findIndex(Validator validator) {
        return null;
    }
    
    public Integer findLastIndex(Validator validator) {
        return null;
    }
    
    public Boolean every(Validator validator) {
        return null;
    }
    
    public Boolean any(Validator validator) {
        return null;
    }
    
    public Map<Object, List<Object>> group(Function function) {
        return null;
    }
    
    public Boolean isEmpty() {
        return this.entities.isEmpty();
    }
    
    public Integer size() {
        return this.entities.size();
    }

    public List<Object> collectAsList() {
        return entities;
    }
}
