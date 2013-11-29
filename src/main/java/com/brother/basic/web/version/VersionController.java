package com.brother.basic.web.version;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.brother.basic.entity.AndroidVersion;
import com.brother.basic.entity.User;
import com.brother.basic.search.SearchBean;
import com.brother.basic.search.SearchResult;
import com.brother.basic.service.version.AndroidVersionService;

@Controller
@RequestMapping(value="/admin/version")
public class VersionController {
	
	private static final String APP_NAME = "DaYin.app";
	private static final String APP_PATH = "/app";
	
	@Autowired
	private AndroidVersionService androidVersionService;
	
	@RequestMapping(value="anroidForm")
	public String showAndroidForm(){
		return "/version/adminAndroidVersionForm";
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String showList(){
		return "/version/adminAndroidVersionList";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody SearchResult list(SearchBean search){
		Page<AndroidVersion> pageUser = androidVersionService.getVersionsByPageInfo(search);
		SearchResult result = new SearchResult();
		result.setAaData(pageUser.getContent());
		long total = pageUser.getTotalElements();
		result.setiTotalDisplayRecords(total);
		result.setiTotalRecords(total);
		result.setsEcho(search.getsEcho());
		return result;
	}
	
	@RequestMapping(value="/createAndroidVersion")
	public String createAndroidVersion(@RequestParam MultipartFile app,AndroidVersion version,HttpServletRequest request){
		String rootPath = request.getSession().getServletContext().getRealPath(APP_PATH);
		String  v = version.getVersion();
		String filename = app.getOriginalFilename();
		String sourcePath = rootPath+File.separator+v+File.separator+filename;
		version.setPath(sourcePath);
		String targetPath = rootPath+File.separator+VersionController.APP_NAME;
		try {
			FileUtils.copyInputStreamToFile(app.getInputStream(), new File(sourcePath));
			FileUtils.copyFile(new File(sourcePath), new File(targetPath));
			createUpdateXml(version,rootPath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		androidVersionService.update(version);
		return "redirect:/admin/version";
	}
	
	private void createUpdateXml(AndroidVersion version , String path){
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("update");
		Element ver = root.addElement("version");
		ver.setText(version.getVersion());
		Element name =  root.addElement("name");
		name.setText(version.getName());
		root.addElement("description");
		Element urlElement = root.addElement("apkurl");
		InputStream is = this.getClass().getResourceAsStream("/host.properties");
		Properties properties = new Properties();
		StringBuffer url = new StringBuffer(); 
		try {
			properties.load(is);
			url.append("http://")
				.append(properties.getProperty("project.host")).append(":")
			    .append(properties.getProperty("project.port")).append("/")
			    .append(properties.getProperty("project.name")).append(APP_PATH)
			    .append(File.separator).append(APP_NAME);
		} catch (IOException e) {
			e.printStackTrace();
		}
		urlElement.setText(url.toString());
		
		OutputFormat format = OutputFormat.createPrettyPrint();
        format.setEncoding("UTF-8");// 设置XML文件的编码格式
        try {
			XMLWriter writer = new XMLWriter(new FileWriter(new File(path,"update.xml")), format);
			writer.write(document);
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
}
