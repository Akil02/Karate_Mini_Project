package Run;

import com.intuit.karate.junit5.Karate;

public class FeatureRunnerTest {

	@Karate.Test
    Karate testSample() {
        return Karate.run("classpath:Features"); 
    }
}
