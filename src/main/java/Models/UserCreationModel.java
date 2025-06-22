package Models;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import com.github.javafaker.Faker;

public class UserCreationModel {

	public String name;
    public String gender;
    public String email;
    public String status;
    public String id;

    public UserCreationModel() {
    	String[] gendername = {"Male", "Female"};
    	String[] statusname = {"Active","Inactive"};
    	int number = ThreadLocalRandom.current().nextInt(0, 10000);
        int randomIndexForGender = ThreadLocalRandom.current().nextInt(gendername.length);
        int randomIndexForStatus = ThreadLocalRandom.current().nextInt(statusname.length);
    	Faker faker = new Faker();
    	this.name = faker.name().fullName();
    	this.gender = gendername[randomIndexForGender];
    	this.email = faker.name().firstName().toLowerCase()+"+"+number+"@gmail.com";
    	this.status = statusname[randomIndexForStatus];
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("name", this.name);
        map.put("gender", this.gender);
        map.put("email", this.email);
        map.put("status", this.status);
        return map;
    }
}
