package com.bowang.joybundler.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bowang.joybundler.models.LoginUser;
import com.bowang.joybundler.models.User;
import com.bowang.joybundler.services.UserService;

@Controller
public class LoginRegistrationController {
        
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String index(@ModelAttribute("newUser") User newUser,
            @ModelAttribute("newLogin") LoginUser newLogin) {
        return "/LoginRegistration/loginRegistration.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
            HttpSession session) {
        // register the user
        User user = userService.register(newUser, result);

        // checks if any errors
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "LoginRegistration/loginRegistration.jsp";
        }
        model.addAttribute("user", user);
        session.setAttribute("userId", user.getId());

        return "redirect:/home";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
            HttpSession session) {

        User user = userService.login(newLogin, result);

        // if errors, redirect to the reg and login page
        if (result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "LoginRegistration/loginRegistration.jsp";
        }
        // if no errors, log in the user and
        // store user id in session
        session.setAttribute("userId", user.getId());
        return "redirect:/home";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("userId");
        return "redirect:/";
    }
}
