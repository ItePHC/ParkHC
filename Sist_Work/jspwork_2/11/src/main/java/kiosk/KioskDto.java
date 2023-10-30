package kiosk;

import java.sql.Timestamp;

public class KioskDto {
		   
		   private String num;
		   private String name;
		   private String image;
		   private String price;
		   private String stock;
		   private Timestamp bday;
		   
		public String getNum() {
			return num;
		}
		public void setNum(String num) {
			this.num = num;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public String getStock() {
			return stock;
		}
		public void setStock(String stock) {
			this.stock = stock;
		}
		public Timestamp getBday() {
			return bday;
		}
		public void setBday(Timestamp bday) {
			this.bday = bday;
		}
		   
		  
}