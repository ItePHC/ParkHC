package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	
	private ArrayList<Book> listOfBooks=new ArrayList<Book>();
	private static BookRepository instance=new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}

	public BookRepository() {
		Book book1=new Book("ISDN1234","HTML5_+CSS3",15000);
		book1.setAuthor("Ȳ��ȣ");
		book1.setDescription("���峪 PPT������ ����� �ֳ���? �׷��� ���������ϴ�. ���� �ٷ�"
				+"�������� ���ۿ� �����غ�����. ���� ���� ��ǻ�Ͱ� ��� �������ϴ�."
				+"�ڵ�� ����ȭ�鿡 �ٷ� ������ �����θ� �о ��� �۵��ϴ��� ����"
				+"�ľ��� �� �ִ� ���� �⺻�̰� �߰� �߰� ��� �߰��Ͽ� ����ְ�"
				+"�����ϵ� ������ �� �ֽ��ϴ�."
				);
		book1.setPublisher("�Ѻ��̵��");
		book1.setCategory("Hello Coding");
		book1.setUnitsInStock(1000);
		book1.setTotalPages(288);
		book1.setReleaseDate("2018-03-02");
		book1.setCondition("New");
		
		Book book2=new Book("ISDN1235","���� ���� �ڹ� ���α׷���",27000);
		book2.setAuthor("������");
		book2.setDescription("��ü������ �ٽɰ� �ڹ��� ������ ����� ����� �ٷ�鼭��"
				+"�ʺ��ڰ� ���� �н��� �� �ְ� �����߽��ϴ�."
				+"�ð�ȭ ������ Ȱ���� ���� ����� �������� ���� �ٽ� �ڵ带 ����"
				+"����� ������ �� �帧���� �н��� �� �ֽ��ϴ�."
				+"���� '���� ü���� ������ ����->���� �׽�Ʈ->������ �������� �����ϸ�"
				+"�� �ܰ辿 Ǯ��� ��������->���丮�� ���̵� ��̷ο� ���α׷��� ����"
				+"���� ���� ���α׷��� �Ƿ��� �������� ����ø� �� �ֽ��ϴ�."
				);
		book2.setPublisher("�Ѻ���ī����");
		book2.setCategory("IT �����");
		book2.setUnitsInStock(1000);
		book2.setTotalPages(692);
		book2.setReleaseDate("2017-08-02");
		book2.setCondition("New");
		
		Book book3=new Book("ISDN1236","������4 �Թ�",27000);
		book3.setAuthor("�ϼ����� ����ġ, ������ ��Ÿ��, ��Ű �ڼ���(����ö, ���μ�)");
		book3.setDescription("�������� �ܼ��� ������� ������ �ͺ��� ��Ű��ó��"
				+"��� �����ϰ� �����ϴ����� �� �߿��մϴ�. ������ ������"
				+"�ٿ��ִ� �����δ� ���� ���߿��� �������� ����� Ȱ���� �� �����ϴ�."
				+"�� å������ �� ���ø����̼��� ���ʸ� ������ ������ �ھ ���캸��"
				+"Ŭ���� ����Ƽ�� �Թ����� �ٷ�ϴ�. ���� �� �ǹ��� �پ��"
				+"�� ���ø����̼� �ʱ��ڳ� ���� ������ ������ �������� ����غ� �� ����"
				+"���� ������� ������ �� ���� �����մϴ�."
				);
		book3.setPublisher("�Ѻ� �̵��");
		book3.setCategory("IT �����");
		book3.setUnitsInStock(1000);
		book3.setTotalPages(520);
		book3.setReleaseDate("2022-04-10");
		book3.setCondition("New");
		
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
	
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	public Book getBookById(String bookId) {
		Book bookById=null;
		
		for(int i=0;i<listOfBooks.size();i++) {
			Book book=listOfBooks.get(i);
			if(book !=null && book.getBookId()!=null 
			&& book.getBookId().equals(bookId)) {
				bookById=book;
				break;
			}
		}
		return bookById;
		
	}
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
	
	

}
