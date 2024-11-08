package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor // NonNull 표시해둔 변수만 초기화 하는 생성자
@NoArgsConstructor
@AllArgsConstructor // 모든 필드를 초기화하는 생성자
@Data // 기본메소드 (Getter/Setter) 자동완성
@Getter
@Setter
public class Post {
	// DTO(Data Transfer Object)
	// 계층간 데이터 이동시에 데이터를 담기위해 사용하는 객체

	// 1. 테이블과 동일한 모양으로 설계
	// 컬럼이름 == DTO 필드 변수명
	// 데이터 타입을 같은 유형으로 선언
	// 접근제한자(private)
//	 
//	#{user_id},
//	#{password},
//	#{name},
//	#{birth_date},
//	#{gender},
//	#{phone_number}
	private int post_idx;
	@NonNull
	private String post_type;
	@NonNull
	private String post_title;
	@NonNull
	private String post_content;
	
	private String post_file;
	
	private String create_dt;
	
	private int post_views;
	@NonNull
	private String id;
	// 2. Getter/Setter 메소드 선언

	// 3. 기본생성자가 존재해야한 한다.

}
