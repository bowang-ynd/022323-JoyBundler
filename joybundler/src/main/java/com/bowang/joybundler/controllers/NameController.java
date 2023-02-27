package com.bowang.joybundler.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.bowang.joybundler.models.User;
import com.bowang.joybundler.models.Name.Name;
import com.bowang.joybundler.services.NameService;
import com.bowang.joybundler.services.UserService;

@Controller
public class NameController {
    
    @Autowired 
    private UserService userService;

    @Autowired
    private NameService nameService;

    //! INDEX
    @GetMapping("/home")
    public String index(HttpSession session, Model model){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        User user = userService.readById((Long) session.getAttribute("userId"));
        List<Name> names = nameService.readAllNames();

        model.addAttribute("user", user);
        model.addAttribute("names", names);

        return "index.jsp";
    }

    //! ==================== CREATE ====================
    @GetMapping("/names/new")
    public String createName(HttpSession session, @ModelAttribute("name")Name name, Model model){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        User user = userService.readById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);

        return "Create/createName.jsp";
    }

    @PostMapping("/names/processNewName")
    public String processCreate(@Valid @ModelAttribute("name")Name name, BindingResult result, HttpSession session){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        // check if name is unique
        List<Name> names = nameService.readAllNames();
        for(Name existName : names){
            if(existName.getBabyName().equals(name.getBabyName())){
                result.rejectValue("babyName", "notUnique", "We have this name already. Please come up with a different one!");
                break;
            }
        }

        if(result.hasErrors()){
            return "Create/createName.jsp";
        }

        // after passing the check, create the name
        nameService.createName(name);

        return "redirect:/home";
    }

    //! ==================== READ ONE ====================
    @GetMapping("/names/{id}")
    public String showOneName(HttpSession session, Model model, @PathVariable("id")Long id){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        // only name owner can see and edit the name
        Name name = nameService.readOneName(id);
        User user = userService.readById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);
        model.addAttribute("name", name);

        // checks if the user has voted for the current name
        boolean isVoted = name.getUsers().contains(user);
        model.addAttribute("isVoted", isVoted);

        return "/Show/showName.jsp";
    }

    //! ==================== UPDATE ====================
    @GetMapping("/names/{id}/edit")
    public String editName(HttpSession session, Model model, @PathVariable("id")Long id){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        // only name owner can edit the name
        Name name = nameService.readOneName(id);
        User user = userService.readById((Long) session.getAttribute("userId"));
        if(!name.getUser().getId().equals(user.getId())){
            return "redirect:/home";
        }

        // else, render the update page
        model.addAttribute("user", user);
        model.addAttribute("name", name);

        return "Update/updateName.jsp";
    }

    @PutMapping("/names/processEdit")
    public String processEdit(@Valid @ModelAttribute("name")Name name, BindingResult result, HttpSession session){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        // deny access if user is not the owner
        User user = userService.readById((Long) session.getAttribute("userId"));
        if(!name.getUser().getId().equals(user.getId())){
            return "redirect:/home";
        }

        // return if any errors
        if(result.hasErrors()){
            return "Update/updateName.jsp";
        }

        // update the name
        nameService.updateOneName(name);

        return "redirect:/home";
    }

    //! ==================== DELETE ====================
    @DeleteMapping("/names/{id}/delete")
    public String deleteOneName(HttpSession session, @PathVariable("id")Long id){

        // if user has not logged in, redirect to reg and login page
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }

        // only name owner can edit the name
        Name name = nameService.readOneName(id);
        User user = userService.readById((Long) session.getAttribute("userId"));
        if(!name.getUser().getId().equals(user.getId())){
            System.out.println("There");
            return "redirect:/home";
        }

        name.setUsers(null);
        nameService.updateOneName(name);
        user.getVotedNames().remove(name);
        userService.updateUser(user);

        nameService.deleteOneName(id);
        System.out.println("Here");
        return "redirect:/home";
    }
}
