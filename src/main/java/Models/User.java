package Models;
import java.util.HashMap;
import java.util.concurrent.ThreadLocalRandom;
import java.util.Map;
import com.github.javafaker.Faker;

public class User {
    private String name;
    private String job;

    public User() {
    	String[] names = {"Tester", "Devloper", "Devops", "Cloud", "Support"};
        int randomIndex = ThreadLocalRandom.current().nextInt(names.length);
    	Faker faker = new Faker();
    	this.name = faker.name().fullName();
    	this.job = names[randomIndex];
    	
    }

    public String getName() { return name; }
    public String getJob() { return job; }
    
    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("name", this.name);
        map.put("job", this.job);
        return map;
    }
}

