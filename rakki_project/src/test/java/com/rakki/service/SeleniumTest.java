package com.rakki.service;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Driver;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.By.ByClassName;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriver.Options;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.remote.BrowserType;
import org.openqa.selenium.remote.DriverCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.FileCopyUtils;

import com.rakki.domain.ProductVo;
import com.rakki.mapper.ProductMapper;
import com.rakki.mapper.ProductMapperTests;
import com.rakki.mapper.SellBuyMapper;
import com.sun.xml.internal.ws.server.DraconianValidationErrorHandler;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SeleniumTest {
	private final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	private final String WEB_DRIVER_PATH = "G:\\tools\\chromedriver.exe";
	private String url = "https://kream.co.kr/search?category_id=2&sort=popular&per_page=40";
	
	private WebDriver driver;
	
	@Setter @Autowired
	private ProductMapper mapper;
	
	@Autowired @Setter
	private ProductService service;
	
	public SeleniumTest(){
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		driver = new ChromeDriver();
		
	}
	
	@Test
	public void crawl() throws InterruptedException, ParseException, MalformedURLException, IOException {
		driver.get(url);
		//????????? ????????? ????????? ?????? ??????
//		Thread.sleep(3000);
//		driver.findElement(By.cssSelector("body")).sendKeys(Keys.END);
//		Thread.sleep(3000);
		for(int i = 56; i < 100; i++){
			
			//a ?????? ????????? ??????
			WebElement product = driver.findElements(By.cssSelector(".search_result_list .search_result_item")).get(i);
			product.findElement(By.cssSelector("a")).click();
			
			//????????? ?????? ??????
			Thread.sleep(3000);
				
			// ????????? ????????? ????????? src ?????? ?????????
			String category = "1";
			String image = driver.findElements(By.cssSelector(".slide_item .item_inner .product")).get(0).findElement(select("img")).getAttribute("src");
			String brand = driver.findElement(By.cssSelector(".brand")).getText();
			String name_ko = driver.findElement(By.cssSelector(".sub_title")).getText();
			String name_en = driver.findElement(By.cssSelector(".title")).getText();
			String serialNo = driver.findElements(By.cssSelector(".detail_product .detail_box")).get(0).findElement(select("dd")).getText();
			String color = driver.findElements(By.cssSelector(".detail_product .detail_box")).get(2).findElement(select("dd")).getText();
			String price_rel = driver.findElements(By.cssSelector(".detail_product .detail_box")).get(3).findElement(select("dd")).getText();
			
			String release = driver.findElements(By.cssSelector(".detail_product .detail_box")).get(1).findElement(select("dd")).getText().replace('/','-');
			if(release.equals("-")){ release = "21-11-01"; }
			
			
			log.info(i+1 +"??????");
			
			ProductVo vo = new ProductVo();
			vo.setCategory(category);
			vo.setBrand(brand);
			vo.setSerialNo(serialNo);
			vo.setImage(image);
			vo.setName_ko(name_ko);
			vo.setName_en(name_en);
			vo.setColor(color);
			vo.setPrice_rel(price_rel);
			vo.setRelease(new SimpleDateFormat("yy-MM-dd").parse(release));
			System.out.println(vo);
			service.register(vo);
			
			String pk = vo.getProduct_no().toString();
			Long product_no = Long.parseLong(pk);

			fileDownload(pk, image);
			
			mapper.updateImage(pk, product_no);
			
			
			//url??? ??????
			driver.navigate().back();
			Thread.sleep(2500);	
			if(i+1 >= 40){
				driver.findElement(By.cssSelector("body")).sendKeys(Keys.END);
				Thread.sleep(3000);
				driver.findElement(By.cssSelector("body")).sendKeys(Keys.HOME);
				Thread.sleep(3000);
			}
		}
		
	}
	static By select(String selector){
		return By.cssSelector(selector);
	}
	
static void fileDownload(String pk, String link) throws MalformedURLException, IOException{
		
		String uploadFolder = "D:/workspace_Spring/rakki_project/src/main/webapp/resources/images";
		File uploadPath = new File(uploadFolder, pk);
		if(!uploadPath.exists()){
			uploadPath.mkdirs();
		}
		InputStream is = new URL(link).openStream();
		
		File file = new File(uploadPath, pk+".png");
		
		FileCopyUtils.copy(FileCopyUtils.copyToByteArray(is), file);
	}
}
