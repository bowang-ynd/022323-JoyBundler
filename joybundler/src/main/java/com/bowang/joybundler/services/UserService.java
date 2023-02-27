package com.bowang.joybundler.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.bowang.joybundler.models.LoginUser;
import com.bowang.joybundler.models.User;
import com.bowang.joybundler.repositories.UserRepository;

@Service
public class UserService {
        
    @Autowired 
    private UserRepository userRepository;

    //! ==================== User Register & Login ====================
    public User register(User newUser, BindingResult result){

        // checks if email is already registered
        Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());
        if(potentialUser.isPresent()){
            result.rejectValue("email", "Email", "Email already registered. Please login!");
        }
        //checks if passwords match
        if(!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm", "Confirm", "Passwords do not match!");
        }

        if(result.hasErrors()){
            return null;
        }

        // if no errors, register and return the new user
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepository.save(newUser);
    }

    public User login(LoginUser newLoginObject, BindingResult result){
        
        // find the user in database
        Optional<User> user = userRepository.findByEmail(newLoginObject.getEmail());

        // checks if user exists
        if(!user.isPresent()){
            result.rejectValue("email", "Email", "Invalid Credentials!");
        }

        if(result.hasErrors()){
            return null;
        }
        
        if(!BCrypt.checkpw(newLoginObject.getPassword(), user.orElseThrow().getPassword())) {
            result.rejectValue("email", "Password", "Invalid Credentials!");
        }

        if(result.hasErrors()){
            return null;
        }
        
        return user.orElse(null);
    }
    //! ==================== End of User Registration & Login ====================

    //! READ ONE
    public User readById(Long id){
        Optional<User> optionalUser = userRepository.findById(id);
        return optionalUser.orElse(null);
    }

    //! UPDATE
    public void updateUser(User user){
        userRepository.save(user);
    }
}
