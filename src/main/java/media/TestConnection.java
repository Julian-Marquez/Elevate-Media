package media;

import redis.clients.jedis.JedisPooled;

public class TestConnection {

    public static void main(String[] args) {
        // You can hardcode your URI here for quick testing (not recommended for production)
        // Or pass it as an argument: rediss://default:PASSWORD@HOST:PORT
        String redisUri;
        if (args.length != 1) {
            System.out.println("Usage: java TestConnection <rediss://user:password@host:port>");
            // Example fallback URI for testing:
            redisUri = "rediss://default:AVNS__HQ8LRfqufxakq24q7J@caching-3383eb8b-pawfect-09.h.aivencloud.com:17184";
            System.out.println("Using fallback URI for testing...");
        } else {
            redisUri = args[0];
        }

        try {
            JedisPooled jedis = new JedisPooled(redisUri);
            jedis.set("key", "hello world");
            String value = jedis.get("key");
            System.out.println("Successfully connected to Redis!");
            System.out.println("The value of 'key' is: " + value);
        } catch (Exception e) {
            System.err.println("Failed to connect to Redis:");
            e.printStackTrace();
        }
    }
}
