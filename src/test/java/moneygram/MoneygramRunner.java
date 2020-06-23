package moneygram;

import com.intuit.karate.junit5.Karate;

public class MoneygramRunner {
    @Karate.Test
    Karate testUsers() {
        return new Karate().feature("moneygram").relativeTo(getClass());
    }
}
