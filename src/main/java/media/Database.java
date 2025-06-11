package media;

import redis.clients.jedis.JedisPooled;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.ArrayList;
import java.util.List;

public class Database {

    private static final String REDIS_URI = "rediss://default:AVNS__HQ8LRfqufxakq24q7J@caching-3383eb8b-pawfect-09.h.aivencloud.com:17184";

    private final JedisPooled jedis;

    public Database() {
        this.jedis = new JedisPooled(REDIS_URI);
    }

    // Example: Set a key
    public void createUser(User user) {
        String uuid = UUID.randomUUID().toString();
        String userKey = "user:" + uuid;

        jedis.hset(userKey, "first_name", user.getFirstName());
        jedis.hset(userKey, "last_name", user.getLastName());
        jedis.hset(userKey, "email", user.getEmail());
        
        jedis.hset(userKey, "username", user.getUsername());
        jedis.hset(userKey, "password", user.getPassword());
        
        try {
        if(!user.getPhoneNumber().isEmpty() || user.getPhoneNumber() != null) {
        	jedis.hset(userKey, "phone", user.getPhoneNumber());
        }
        }catch(NullPointerException e){
        	
        }

        // Handle profile picture as byte[] (binary), stored as a separate key
        byte[] profilePic = user.getProfilePic();
        if (profilePic != null || profilePic.length != 0) {
            jedis.set(("user:" + uuid + ":profilePic").getBytes(), profilePic);
        }
        System.out.println("Attempting to insert:" + user.getEmail());
    }
    
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        Set<String> keys = jedis.keys("user:*");

        for (String key : keys) {
            if (key.endsWith(":profilePic")) continue;

            String[] parts = key.split(":");
            if (parts.length < 2) continue;

            String uuid = parts[1];
            String userKey = "user:" + uuid;

            try {
                String fname = jedis.hget(userKey, "first_name");
                String lname = jedis.hget(userKey, "last_name");
                String phoneNum = jedis.hget(userKey, "phone");
                String username = jedis.hget(userKey, "username");
                String password = jedis.hget(userKey, "password");
                String email = jedis.hget(userKey, "email");

                User user = new User(fname, lname, email, username, password);
                
                try {
                    if(!phoneNum.isEmpty() || phoneNum != null) {
                    	user.setPhoneNumber(phoneNum);
                    }
                    }catch(NullPointerException e){
                    	
                    }
                byte[] profilePic = jedis.get(("user:" + uuid + ":profilePic").getBytes());
                if (profilePic != null) {
                    user.setProfilePic(profilePic);
                }

                users.add(user);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return users;
    }

    public void clearAllUsers() { //debugging purpopes
        Set<String> keys = jedis.keys("user:*");
        if (keys != null && !keys.isEmpty()) {
            jedis.del(keys.toArray(new String[0]));
            System.out.println("All user data has been cleared from Redis.");
        } else {
            System.out.println("No user data found to clear.");
        }
    }

    public void deleteUser(User user) {
        Set<String> keys = jedis.keys("user:*");

        for (String key : keys) {
            if (key.endsWith(":profilePic")) continue; // Skip binary keys for now

            String username = jedis.hget(key, "username");
            String email = jedis.hget(key, "email");

            // Match based on username and/or email
            if ((username != null && username.equals(user.getUsername())) ||
                (email != null && email.equals(user.getEmail()))) {

                // Extract UUID part to remove profilePic if exists
                String[] parts = key.split(":");
                if (parts.length >= 2) {
                    String uuid = parts[1];
                    String profilePicKey = "user:" + uuid + ":profilePic";

                    // Delete profilePic if exists
                    jedis.del(profilePicKey.getBytes());
                }

                // Delete the main user hash
                jedis.del(key);
                System.out.println("Deleted user: " + username + " (" + email + ")");
                return;
            }
        }

    }
    public boolean updateUser(User updatedUser) {
        Set<String> keys = jedis.keys("user:*");

        for (String key : keys) {
            if (key.endsWith(":profilePic")) continue;

            String existingUsername = jedis.hget(key, "username");
            String existingEmail = jedis.hget(key, "email");

            if ((existingUsername != null && existingUsername.equals(updatedUser.getUsername())) ||
                (existingEmail != null && existingEmail.equals(updatedUser.getEmail()))) {

                // Update fields
                jedis.hset(key, "first_name", updatedUser.getFirstName());
                jedis.hset(key, "last_name", updatedUser.getLastName());
                jedis.hset(key, "email", updatedUser.getEmail());
                jedis.hset(key, "phone", updatedUser.getPhoneNumber());
                jedis.hset(key, "username", updatedUser.getUsername());
                jedis.hset(key, "password", updatedUser.getPassword());

                // Handle profile picture update
                String[] parts = key.split(":");
                if (parts.length >= 2) {
                    String uuid = parts[1];
                    String profilePicKey = "user:" + uuid + ":profilePic";

                    byte[] profilePic = updatedUser.getProfilePic();
                    if (profilePic != null) {
                        jedis.set(profilePicKey.getBytes(), profilePic);
                    } else {
                        jedis.del(profilePicKey.getBytes());
                    }
                }

                System.out.println("Updated user: " + updatedUser.getUsername());
                return true;
            }
        }

        System.out.println("User not found: " + updatedUser.getUsername());
        return false;
    }


    // Example: Get a key
    public Optional<String> getValue(String key) {
        String result = jedis.get(key);
        return Optional.ofNullable(result);
    }

    // Example: Delete a key
    public void deleteKey(String key) {
        jedis.del(key);
    }

}
