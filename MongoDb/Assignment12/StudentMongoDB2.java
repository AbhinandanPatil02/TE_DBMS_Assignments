package mongoJava;


import java.util.*;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;
import org.bson.Document;

public class StudentMongoDB2 {
	

	public static void main(String[] args) {
		MongoClient client=new MongoClient("127.0.0.1",27017);
		System.out.println("Connected to mongodb");
		MongoDatabase db=client.getDatabase("student_db");
		MongoCollection<Document>doc=db.getCollection("student");
		Scanner sc=new Scanner(System.in);
		
		
		while(true) {
			System.out.println("Enter choice \n 1) Insert \n 2)Update \n 3) Delete\n4) Show\n 5) Exit");
			int op= sc.nextInt();
			sc.nextLine();
			
			switch(op) {
			case 1:
				insert(doc,sc);
				break;
			
			case 2:
				update(doc,sc);
				break;
			case 3:
				delete(doc,sc);
				break;
			case 4:
				show(doc,sc);
				break;
			case 5:
				System.out.println("Exiting");
				return;
			default:
				System.out.println("Invalid choice ");
			}
		}

	}
	
	private static void insert(MongoCollection<Document>doc,Scanner sc) {
		System.out.println("Enter roll no : ");
		int roll=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter name : ");
		String name =sc.nextLine();
		System.out.println("Enter marks : ");
		int marks =sc.nextInt();
		 sc.nextLine();
		System.out.println("Enter fav game : ");
		String fav= sc.nextLine();
		
		Document d=new Document("roll_no",roll)
				  .append("name",name)
				  .append("marks", marks)
				  .append("fav_game", fav);
		doc.insertOne(d);
		System.out.println("Student Entered Successfully");
		
	}
	private static void update(MongoCollection<Document>doc,Scanner sc) {
		System.out.println("Enter roll no to update : ");
		int roll=sc.nextInt();
		sc.nextLine();
		System.out.println("Enter name : ");
		String name =sc.nextLine();
		System.out.println("Enter marks : ");
		int marks =sc.nextInt();
		 sc.nextLine();
		System.out.println("Enter fav game : ");
		String fav= sc.nextLine();
		
		Document d=new Document("roll_no",roll);
		Document up=new Document("name",name)
				  .append("marks", marks)
				  .append("fav_game", fav);
		doc.updateOne(d,new Document ("$set",up));
		System.out.println("Student Updated Successfully");
		
	}
	private static void delete(MongoCollection<Document>doc,Scanner sc) {
		System.out.println("Enter roll no to delete : ");
		int roll=sc.nextInt();
		sc.nextLine();
		Document d=new Document("roll_no",roll);
		doc.deleteOne(d);
		
	}
	private static void show(MongoCollection<Document>doc,Scanner sc) {
		System.out.println("Showing database : ");
		for(Document d :doc.find()) {
			System.out.println(d.toJson());
		}
	}

}


