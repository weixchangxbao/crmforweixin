package com.brother.basic.web.log;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.brother.basic.entity.ActionLog;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.log.ActionLogService;

@Controller
@RequestMapping(value="/admin/logs")
public class ActionLogController {
	@Autowired
	private ActionLogService actionLogService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String show(){
		return "/logs/ActionLogList";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody SearchResult listLogs(SearchBean search){
		Page<ActionLog> pageUser = actionLogService.findActionByPage(search);
		SearchResult result = new SearchResult();
		result.setAaData(pageUser.getContent());
		long total = pageUser.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
	
	@RequestMapping(value="delete")
	public String delete(@RequestParam("ids") String ids){
		if(ids != null && !ids.equals("")){
			String[] idArray = ids.split(",");
			for(String id: idArray){
				actionLogService.delete(Long.parseLong(id));
			}
			
		}
		return "redirect:/admin/logs";
	}
}
