package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.State;
import data.StateDAO;

@Controller
@SessionAttributes("current")
public class StateController {
	@Autowired
	private StateDAO stateDao;
	
	
	@ModelAttribute("current")
	public Integer initSessionObject() {
		return 1;
	}
	

	
	@RequestMapping(path="submit.do", params="next")
	public ModelAndView next(@ModelAttribute("current") Integer current) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		if (current >= 50) {
			current = 0;
		}
		
		mv.addObject("current", ++current);
		
		
		System.out.println(current);
		State s = stateDao.getStateById(current);
		mv.addObject("state", s);
		//System.out.println("navigating to " + s.getName());
		
		return mv;
	}
	
	@RequestMapping(path="submit.do", params="previous")
	public ModelAndView previous(@ModelAttribute("current") Integer current) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		 if (current <= 1) {
			current = 51;
		}
		
			mv.addObject("current", --current);
		
		System.out.println(current);
		State s = stateDao.getStateById(current);
		mv.addObject("state", s);
		return mv;
	}

	@RequestMapping(path="GetStateData.do", 
			params="name",
			method=RequestMethod.GET)
	public ModelAndView getByName(@RequestParam("name") String n) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("state", stateDao.getStateByName(n));
		return mv;
	}
	
	@RequestMapping(path="GetStateData.do", 
			params="abbrev",
			method=RequestMethod.GET)
	public ModelAndView getByAbbrev(@RequestParam("abbrev") String a) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		mv.addObject("state", stateDao.getStateByAbbreviation(a));
		return mv;
	}
	
	@RequestMapping(path="NewState.do",
			method=RequestMethod.POST)
	public ModelAndView newState(State state) {
		stateDao.addState(state);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result.jsp");
		return mv;
	}
	@RequestMapping("getAllState.do")
	public ModelAndView viewAllStates() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("allStates.jsp");
		mv.addObject("states", stateDao.getAllStates());
		return mv;
	}
}
