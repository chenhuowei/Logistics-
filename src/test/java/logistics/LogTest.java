package logistics;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.slf4j.LoggerFactory;

import com.manway.utils.EncryptUtil;
public class LogTest {

	@Test
	public void log4j(){

		Logger logger = Logger.getLogger(LogTest.class);

		logger.info("yes");

		org.slf4j.Logger logger2 = LoggerFactory.getLogger(LogTest.class);
		String id ="123456789";
		String sy="chenhuo";
		logger2.info("Processing trade with id: {} and symbol : {} ", id,sy);

		logger2.info(EncryptUtil.md5Encode("123456"));
		logger2.warn("hello");

		
	}
	
}
