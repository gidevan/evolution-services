package com.vano.projects.evolution.controllers;

import com.vano.projects.evolution.service.EvolutionService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by IntelliJ IDEA.
 * User: Ivan_Pukhau
 * Date: 12/2/11
 * Time: 9:08 AM
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class EvolutionController {

    private static final String TERRA = "terra";
    private static final String TERRITORY_AGE = "territoryAge";
    private static final String STATISTIC = "statistic";
    private static final Logger log = Logger.getLogger(EvolutionController.class);

    @Autowired
    private EvolutionService evolutionService;

    @RequestMapping("/hello.html")
    public ModelAndView helloWorld() {
        ModelAndView mav = new ModelAndView("hello");
        mav.addObject("message", "Hello world!!1");
        return mav;
    }

    @RequestMapping(value = "/territory.html", method = RequestMethod.GET)
    public ModelAndView getTerritoryByAge(@RequestParam(required = false) String age) {
        int iterationNumber = 0;
        try {
            iterationNumber = Integer.parseInt(age);
        } catch (NumberFormatException e){
            log.info("Request parameter age is null or not integer");
        }
        ModelAndView mav = new ModelAndView("territory");
        for(int i = 0; i < iterationNumber; i++) {
            evolutionService.iterate();
        }
        mav.addObject(TERRA, evolutionService.getTerra());
        mav.addObject(STATISTIC, evolutionService.getTerritoryStatistic());
        mav.addObject(TERRITORY_AGE, evolutionService.getTerritoryAge());
        return mav;
    }

    public EvolutionService getEvolutionService() {
        return evolutionService;
    }

    public void setEvolutionService(EvolutionService evolutionService) {
        this.evolutionService = evolutionService;
    }
}
