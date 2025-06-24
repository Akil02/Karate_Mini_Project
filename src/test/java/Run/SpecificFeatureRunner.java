package Run;

import com.intuit.karate.junit5.Karate;

public class SpecificFeatureRunner {

	@Karate.Test
    Karate testSample() {
        return Karate.run("classpath:Features/Register.feature"); 
    }
	
}
