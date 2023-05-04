package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Cust;
import com.kbstar.service.AdmService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@Slf4j
@Controller
public class MainController {

    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    AdmService service;
    @RequestMapping("/")
    public String main() {
        return "index";
    }

    @RequestMapping("/charts")
    public String charts(Model model) {
        model.addAttribute("center", "charts");
        return "index";
    };

    @RequestMapping("/livechart")
    public String livechart(Model model) {
        model.addAttribute("center", "livechart");
        return "index";
    };
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    };
    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession session) {
        if( session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginfail";
        log.info(id, pwd);
        try {
            adm = service.get(id);
            if(adm != null) {
                if(adm != null && encoder.matches(pwd, adm.getPwd())) {
                    nextPage = "loginok";
                    session.setMaxInactiveInterval(600000);
                    session.setAttribute("loginadm", adm);
                }
            }
        } catch (Exception e) {
            throw new Exception("loginimpl 에러");
        }
        model.addAttribute("center", nextPage);
        return "index";
    };
    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    };
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            service.register(adm);
            session.setAttribute("loginadm", adm);
        } catch (Exception e) {
            throw new Exception("registerimpl 시스템 에러");
        }
        model.addAttribute("center", "registerok");
        model.addAttribute("radm", adm);
        return "index";
    };

    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception{
        int result = 0;
        Adm adm = null;
        adm = service.get(id);

        if(adm != null) {
            result=1;
        }
        return result;
    }

    }


