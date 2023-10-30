package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity						
@Table(name = "mycar")										//자동으로 mysql에 mycar라는 테이블이 만들어짐
@Data
public class MyCarDto {
	
	@Id														//각 Entity를 구별할수 있도록 설계(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO)			
	private long num;
	
	@Column(name = "carname")								//이름을 따로 지정할 떈 뒤에 지정할 이름을 붙여줌
	private String carname;
	
	@Column													//이름이 같으면 생략가능
	private int carprice;
	
	@Column													
	private String carcolor;
	
	@Column													
	private String carguip;
	
	@Column
	private String carphoto;
	
	@CreationTimestamp										//엔티티가 생성되는 시점의 시간에 자동 등록
	@Column(updatable = false)								//***업데이트시 자동 업데이트가 되지 않도록 함
	// @Column(updatable = false) 가 없을 시 날짜가 null로 수정됨
	private Timestamp guipday;								
	
}
