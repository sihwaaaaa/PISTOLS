package kr.co.poetrypainting.jsp.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Member {
	
	private String id;
	private String pw;
	private String name;
	private Date regdate;
	
}
