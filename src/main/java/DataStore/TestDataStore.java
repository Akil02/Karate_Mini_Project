package DataStore;

import java.util.HashMap;
import java.util.Map;

public class TestDataStore {

	private static Map<String, Object> data = new HashMap<>();

    public static void put(String key, Object value) {
        data.put(key, value);
    }

    public static Object get(String key) {
        return data.get(key);
    }
}
