package com.numberONe.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UnicodeUtils {
	public UnicodeUtils() {

	}
	
	/**
	 * 英文,标点符号转Unicode
	 * @param s
	 * @return
	 */
	public static String stringToUnicode(String s) {
		String str = "";
		for (int i = 0; i < s.length(); i++) {
			int ch = (int) s.charAt(i);
			if (ch > 255)
				str += "\\u" + Integer.toHexString(ch);
			else
				str += "\\u00" + Integer.toHexString(ch);
		}
		return str;
	}


	private static final char[] hexDigit = {

	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E',
			'F'

	};

	private static char toHex(int nibble) {

		return hexDigit[(nibble & 0xF)];

	}

	/**
	 * 中文转换为Unicode码
	 * 
	 * @param theString
	 * @param escapeSpace
	 * @return
	 */
	public static String toUnicode(String theString, boolean escapeSpace) {

		int len = theString.length();

		int bufLen = len * 2;

		if (bufLen < 0) {

			bufLen = Integer.MAX_VALUE;

		}

		StringBuffer outBuffer = new StringBuffer(bufLen);

		for (int x = 0; x < len; x++) {

			char aChar = theString.charAt(x);

			// Handle common case first, selecting largest block that

			// avoids the specials below

			if ((aChar > 61) && (aChar < 127)) {

				if (aChar == '\\') {

					outBuffer.append('\\');
					outBuffer.append('\\');

					continue;

				}

				outBuffer.append(aChar);

				continue;

			}

			switch (aChar) {

			case ' ':

				if (x == 0 || escapeSpace)

					outBuffer.append('\\');

				outBuffer.append(' ');

				break;

			case '\t':
				outBuffer.append('\\');
				outBuffer.append('t');

				break;

			case '\n':
				outBuffer.append('\\');
				outBuffer.append('n');

				break;

			case '\r':
				outBuffer.append('\\');
				outBuffer.append('r');

				break;

			case '\f':
				outBuffer.append('\\');
				outBuffer.append('f');

				break;

			case '=': // Fall through

			case ':': // Fall through

			case '#': // Fall through

			case '!':

				outBuffer.append('\\');
				outBuffer.append(aChar);

				break;

			default:

				if ((aChar < 0x0020) || (aChar > 0x007e)) {

					outBuffer.append('\\');

					outBuffer.append('u');

					outBuffer.append(toHex((aChar >> 12) & 0xF));

					outBuffer.append(toHex((aChar >> 2) & 0xF));

					outBuffer.append(toHex((aChar >> 4) & 0xF));

					outBuffer.append(toHex(aChar & 0xF));

				} else {

					outBuffer.append(aChar);

				}

			}

		}

		return outBuffer.toString();

	}

	/**
	 * Unicode码转换为中文
	 * 
	 * @param str
	 * @return
	 */
	public static String fromUnicode(String str) {

		return fromUnicode(str.toCharArray(), 0, str.length(), new char[1024]);

	}

	/*
	 * 
	 * Converts encoded &#92;uxxxx to unicode chars
	 * 
	 * and changes special saved chars to their original forms
	 */

	public static String fromUnicode(char[] in, int off, int len,
			char[] convtBuf) {

		if (convtBuf.length < len) {

			int newLen = len * 2;

			if (newLen < 0) {

				newLen = Integer.MAX_VALUE;

			}

			convtBuf = new char[newLen];

		}

		char aChar;

		char[] out = convtBuf;

		int outLen = 0;

		int end = off + len;

		while (off < end) {

			aChar = in[off++];

			if (aChar == '\\') {

				aChar = in[off++];

				if (aChar == 'u') {

					// Read the xxxx

					int value = 0;

					for (int i = 0; i < 4; i++) {

						aChar = in[off++];

						switch (aChar) {

						case '0':

						case '1':

						case '2':

						case '3':

						case '4':

						case '5':

						case '6':

						case '7':

						case '8':

						case '9':

							value = (value << 4) + aChar - '0';

							break;

						case 'a':

						case 'b':

						case 'c':

						case 'd':

						case 'e':

						case 'f':

							value = (value << 4) + 10 + aChar - 'a';

							break;

						case 'A':

						case 'B':

						case 'C':

						case 'D':

						case 'E':

						case 'F':

							value = (value << 4) + 10 + aChar - 'A';

							break;

						default:

							throw new IllegalArgumentException(

							"Malformed \\uxxxx encoding.");

						}

					}

					out[outLen++] = (char) value;

				} else {

					if (aChar == 't') {

						aChar = '\t';

					} else if (aChar == 'r') {

						aChar = '\r';

					} else if (aChar == 'n') {

						aChar = '\n';

					} else if (aChar == 'f') {

						aChar = '\f';

					}

					out[outLen++] = aChar;

				}

			} else {

				out[outLen++] = (char) aChar;

			}

		}

		return new String(out, 0, outLen);

	}
	public static String getNewStrBack(String str){
		String strList = "abcdefghijklmnopqrstuvwxyz";
		StringBuffer strbu = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			int index = strList.indexOf(str.substring(i, i+1).toLowerCase());
			String twp = str.substring(i, i+1);
			boolean isu = Character.isUpperCase(twp.charAt(0));
			if(index == 0){
				if(isu){
					strbu.append(strList.substring(25, 26).toUpperCase());
				}else{
					strbu.append(strList.substring(25, 26));	
				}
				
			}else if(index == -1){
				strbu.append(str.substring(i, i+1));
			}else{
				if(isu){
					strbu.append(strList.substring(index-1, index).toUpperCase());
				}else{
					strbu.append(strList.substring(index-1, index));
				}
			}
			
		}
		return strbu.toString();
		
	}
	
	public static String getNewStrNext(String str){
		String strList = "abcdefghijklmnopqrstuvwxyz";
		StringBuffer strbu = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			int index = strList.indexOf(str.substring(i, i+1).toLowerCase());
			String twp = str.substring(i, i+1);
			boolean isu = Character.isUpperCase(twp.charAt(0));
			if(index == 25){
				if(isu){
					strbu.append(strList.substring(0, 1).toUpperCase());
				}else{
					strbu.append(strList.substring(1, 1));	
				}
				
			}else if(index == -1){
				strbu.append(str.substring(i, i+1));
			}else{
				if(isu){
					strbu.append(strList.substring(index+1, index+2).toUpperCase());
				}else{
					strbu.append(strList.substring(index+1, index+2));
				}
			}
			
		}
		System.out.println(strbu.toString());
		return strbu.toString();
		
	}
    public static String escapeHtml(String html) {
	String htmlStr = html;
	String textStr = "";
	try {
		if(htmlStr != null){
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";

		    String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";

		    String regEx_html = "<[^>]+>";
		    String regEx_html1 = "<[^>]+";
		    Pattern p_script = Pattern.compile(regEx_script, 2);
		    Matcher m_script = p_script.matcher(htmlStr);
		    htmlStr = m_script.replaceAll("");

		    Pattern p_style = Pattern.compile(regEx_style, 2);
		    Matcher m_style = p_style.matcher(htmlStr);
		    htmlStr = m_style.replaceAll("");

		    Pattern p_html = Pattern.compile(regEx_html, 2);
		    Matcher m_html = p_html.matcher(htmlStr);
		    htmlStr = m_html.replaceAll("");

		    Pattern p_html1 = Pattern.compile(regEx_html1, 2);
		    Matcher m_html1 = p_html1.matcher(htmlStr);
		    htmlStr = m_html1.replaceAll("");

		    htmlStr = htmlStr.replace("\"", "“");
		    textStr = htmlStr;
		}	    
	} catch (Exception e) {
	    System.err.println("Html2Text: " + e.getMessage());
	}

	return textStr;
    }
	
    public static String hexStringToString(String s) {
        if (s == null || s.equals("")) {
            return null;
        }
        s = s.replace(" ", "");
        byte[] baKeyword = new byte[s.length()/2];
        for (int i = 0; i < baKeyword.length; i++) {
            try {
                baKeyword[i] = (byte) (0xff & Integer.parseInt(s.substring(i * 2, i * 2 + 2), 16));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            s = new String(baKeyword, "utf-8");
            new String();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return s;
    }
}
