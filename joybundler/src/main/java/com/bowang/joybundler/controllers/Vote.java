package com.bowang.joybundler.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bowang.joybundler.models.User;
import com.bowang.joybundler.models.Name.Name;
import com.bowang.joybundler.services.NameService;
import com.bowang.joybundler.services.UserService;

@Controller
public class Vote {
    
    @Autowired 
    private UserService userService;

    @Autowired
    private NameService nameService;

    @GetMapping("/names/{id}/vote")
    public String vote(HttpSession session, @PathVariable("id")Long id){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        //get the current user and name
        User user = userService.readById((Long) session.getAttribute("userId"));
        Name name = nameService.readOneName(id);
        
        for(User cuser: name.getUsers()){
            System.out.println(cuser.getUsername());
        }

        List<Name> votedNames = user.getVotedNames();
        if(votedNames.contains(name)){
            return "redirect:/home";
        }
        
        name.getUsers().add(user);
        nameService.updateOneName(name);

        return "redirect:/home";
    }

}
