package com.example.util;

public class util {
	public String Convert_From_Integer_To_2letterString(int x) {
		String ret="";
		if(x<10) ret = "0"+String.valueOf(x);
		else ret = String.valueOf(x);
		return ret;
	}
	
	public String Convert_From_1letterString_To_2letterString(String x) {
		String ret="";
		if(x.length()<2) ret = "0"+x;
		else ret = x;
		return ret;
	}
	
	public String null_chk(Object str,String null_replace) {
		if(str == null) {
			return null_replace;
		}
		else {
			return (String) str;
		}
	}
}
