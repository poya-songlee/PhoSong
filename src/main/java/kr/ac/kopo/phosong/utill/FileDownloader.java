package kr.ac.kopo.phosong.utill;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import com.sun.mail.iap.Response;

public class FileDownloader {
	final String uploadPath = "c:/upload/";
	public void download(String uuid, HttpServletResponse response) throws Exception {
		try {
			File file = new File(uploadPath+uuid); // 지정한 경로파일을 객체로 저장하는건가?
			response.setHeader("Content-Disposition", "attachment;filename="+file.getName());
			//이거는 잘 모르겠다.. 다운로드하는 주체같은데...
			
			FileInputStream fileinput = new FileInputStream(uploadPath+uuid);
			//내가 입력할 파일을 Byte단위로 읽어오기위해서 사용하는 객체임. 지정한 경로의 파일을 읽을것같다. 분해의 느낌?
			OutputStream fileOut = response.getOutputStream();
			//데이터를 파일에 바이트 스트림으로 저장하기위해 사용되는 객체임. = 잘 못알아듣겠음 ㅜ 
			//대충 Byte단위의 데이터를 파일에 저장하기 위해서 사용한다는 건가???  조립느낌?
			
			int read =0; // fileinput을 Byte단위로 읽어와야하니 크기계산을 위한 변수선언 
			byte[]buffer = new byte[1024]; // 읽어올 byte를 담을 1024사이즈의 byte배열 선언  
			while((read=fileinput.read(buffer)) != -1) { // read는 1024 = fileinput.read는 1024
				//아마도 fileinput.read(buffer)에서 데이터를 읽고나면 읽어온 값 만큼 정수를 반환하나봄..?
				fileOut.write(buffer, 0, read); // fileOut객체에 Byte로 읽어온 배열값들을 넣어줌. 0번부터, read까지(아마1024?)
			}
			//버튼을 누른 순간 위의 과정들이 진행되고 input으로 읽은 데이터가 0이되고 fileout에 모두 담겼을때 다운로드가 완료되는건가?
			
			
		} catch (FileNotFoundException e) {
			throw new Exception("download error");
		}
		
	}

}
