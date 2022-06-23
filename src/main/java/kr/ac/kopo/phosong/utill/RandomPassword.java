package kr.ac.kopo.phosong.utill;

import java.security.SecureRandom;
import java.util.Date;

public class RandomPassword {
	
	public static String getRamdomPassword(){
		int size = 16;
		int index = 0;
		char[] charSet = new char[]{
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'!', '@', '#', '$', '%', '^', '&'
				};
		
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int len = charSet.length;
		for (int i=0; i<size; i++) {
			index = sr.nextInt(len);
			sb.append(charSet[index]);
			}
		return sb.toString();
		}
}
