package kr.co.poetrypainting.jsp.util;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import kr.co.poetrypainting.jsp.domain.Board;
import kr.co.poetrypainting.jsp.domain.Criteria;
import kr.co.poetrypainting.jsp.domain.Member;

public class paramSolver {

	
	public static <T> T getParams(HttpServletRequest req, Class<T> clazz) {
		T t = null;
		
		try {
			t = clazz.getDeclaredConstructor().newInstance();
			//선언 필드에 대한 타입 및 이름 체크
			Field[] fields = clazz.getDeclaredFields();
			for (Field f : fields) {
				String fieldName = f.getName();
				String setterName = "set" + fieldName.substring(0,1).toUpperCase()+ fieldName.substring(1);
				Method[] methods = clazz.getDeclaredMethods();
				for (Method m : methods) {
					if(setterName.equals(m.getName())) {
						if(req.getParameter(fieldName) == null) {
							continue;
						}
						if(f.getType() == int.class || f.getType() == Integer.class) {
							m.invoke(t,Integer.parseInt(req.getParameter(fieldName)));
						}	
						if(f.getType() == String.class) {
							m.invoke(t, req.getParameter(fieldName));
						}	
						if(f.getType() == String[].class) {
							m.invoke(t, (Object)req.getParameterValues(fieldName));
						}
						if(f.getType() == Long.class || f.getType() == long.class ) {
							m.invoke(t, Long.valueOf(req.getParameter(fieldName)));
						}
						
					}	
				}
			}
			
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return t;
	}
	
	public static boolean isLogin(HttpServletRequest req) {
		return req.getSession().getAttribute("member") != null;
	}
	public static boolean isMine(HttpServletRequest req, String writer) {
		return isLogin(req) && ((Member)req.getSession().getAttribute("member")).getId().equals(writer);
	}

	
	
	public static void main(String[] args) {
		getParams(null, Criteria.class);
	}
}
