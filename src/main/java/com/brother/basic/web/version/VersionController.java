package com.brother.basic.web.version;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.brother.basic.entity.Version;

@Controller
@RequestMapping(value="/admin/version")
public class VersionController {
	
	private static final String APP_NAME = "DaYin.app";
	
	@RequestMapping(value="anroidForm")
	public String showAndroidForm(){
		return "/version/adminAndriodVersionForm";
	}
	
	@RequestMapping(value="/createAndroidVersion")
	public void createAndroidVersion(@RequestParam MultipartFile app,Version version,HttpServletRequest request){
		String rootPath = request.getSession().getServletContext().getRealPath("/app");
		String  v = version.getVersion();
		String filename = app.getOriginalFilename();
		String sourcePath = rootPath+File.separator+v+File.separator+filename;
		String targetPath = rootPath+File.separator+VersionController.APP_NAME;
		try {
			FileUtils.copyInputStreamToFile(app.getInputStream(), new File(sourcePath));
			FileUtils.copyFile(new File(sourcePath), new File(targetPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
