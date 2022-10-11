public interface IPipe {
    IPipe flat();
    IPipe transform(Function function);
    IPipe flatTransform(Function function);
    IPipe filter(Validator validator);
    IPipe reduce(BiFunction biFunction);
    IPipe sort(BiFunction biFunction);
    void forEach(Consumer consumer);
    Object find(Validator validator);
    Object findLast(Validator validator);
    Integer findIndex(Validator validator);
    Integer findLastIndex(Validator validator);
    Boolean every(Validator validator);
    Boolean any(Validator validator);
    Map<Object, List<Object>> group(Function function);
    Boolean isEmpty();
    Integer size();
}