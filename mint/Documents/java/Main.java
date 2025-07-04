class SimpleBox<T> {
    private T value;

    public void setValue(T value) {
        this.value = value;
    }

    public T getValue() {
        return value;
    }
}

public class Main {
    public static void main(String[] args) {
        SimpleBox<String> box1 = new SimpleBox<>();
        box1.setValue("Hello Generic");
        System.out.println("Chuỗi trong box1: " + box1.getValue());

        SimpleBox<Integer> box2 = new SimpleBox<>();
        box2.setValue(2025);
        System.out.println("Số trong box2: " + box2.getValue());
    }
}
