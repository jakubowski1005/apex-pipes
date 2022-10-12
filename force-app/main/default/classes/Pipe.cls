public with sharing class Pipe implements IPipe {
    private List<Object> entities;
    
    private Pipe(List<Object> entities) {
        this.entities = entities;
    }

    public static Pipe of(List<Object> entities) {
        return new Pipe(entities);
    }

    public static Pipe of(Object entity) {
        return new Pipe(new List<Object> { entity });
    }

    public Pipe flat() {
        List<Object> results = new List<Object>();
        List<List<Object>> listOfObjects = (List<List<Object>>) entities;
        for (List<Object> objects : listOfObjects) {
            results.addAll(objects);
        }
        this.entities = results;
        return this;
    }

    public Pipe transform(Function function) {
        List<Object> results = new List<Object>();
        for (Object entity : entities) {
            results.add(function.call(entity));
        }
        this.entities = results;
        return this;
    }

    public Pipe flatTransform(Function function) {
        return this.flat().transform(function);
    }
    
    public Pipe filter(Validator validator) {
        List<Object> results = new List<Object>();
        for (Object entity : entities) {
            if (validator.check(entity)) {
                results.add(entity);
            }
        }
        this.entities = results;
        return this;
    }
    
    public Pipe reduce(BiFunction biFunction) {
        List<Object> result = new List<Object>();
        Object curr = entities[0];
        for (Integer i = 1; i < size(); i++) {
            Object next = entities[i];
            curr = biFunction.call(curr, next);
        }
        result.add(curr);
        this.entities = result;
        return this;
    }
    
    public Pipe sort(BiFunction biFunction) {
        List<Object> result = new List<Object>();
        for (Integer i = 0; i < size() - 1; i++) {
            for (Integer j = 0; j < size() - i - 1; j++) {
                Object curr = entities[j];
                Object next = entities[j + 1];
                if (biFunction.call(curr, next) == 1) {
                    entities[j] = next;
                    entities[j + 1] = curr;
                }
            }
        }
        return this;
    }
    
    public void forEach(Consumer consumer) {
        for (Object entity : entities) {
            consumer.put(entity);
        }
        return;
    }

    public void forEach(BiConsumer biConsumer, Object param) {
        for (Object entity : entities) {
            biConsumer.put(entity, param);
        }
        return;
    }
    
    public Object find(Validator validator) {
        Integer index = findIndex(validator);
        return index == -1 ? null : entities[index];
    }
    
    public Object findLast(Validator validator) {
        Integer index = findLastIndex(validator);
        return index == -1 ? null : entities[index];
    }
    
    public Integer findIndex(Validator validator) {
        for (Integer i = 0; i < size(); i++) {
            if (validator.check(entities[i])) {
                return i;
            }
        }
        return -1;
    }
    
    public Integer findLastIndex(Validator validator) {
        for (Integer i = entities.size() - 1; i >= 0; i--) {
            if (validator.check(entities[i])) {
                return i;
            }
        }
        return -1;
    }
    
    public Boolean every(Validator validator) {
        for (Object entity : entities) {
            if (!validator.check(entity)) {
                return false;
            }
        }
        return true;
    }
    
    public Boolean any(Validator validator) {
        for (Object entity : entities) {
            if (validator.check(entity)) {
                return true;
            }
        }
        return false;
    }
    
    public Map<Object, List<Object>> group(Function function) {
        Map<Object, List<Object>> result = new Map<Object, List<Object>>();
        for (Object entity : entities) {
            Object key = function.call(entity);
            if (result.containsKey(key)) {
                result.get(key).add(entity);
            } else {
                List<Object> values = new List<Object> { entity };
                result.put(key, values);
            }
        }
        return result;
    }

    public Map<Object, List<Object>> group(BiFunction biFunction, Object param) {
        Map<Object, List<Object>> result = new Map<Object, List<Object>>();
        for (Object entity : entities) {
            Object key = biFunction.call(entity, param);
            if (result.containsKey(key)) {
                result.get(key).add(entity);
            } else {
                List<Object> values = new List<Object> { entity };
                result.put(key, values);
            }
        }
        return result;
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
