package frittle

class Dashboard {

	List cards 
	static hasMany = [cards: Card]
	
	List users
	static belongsTo = [users:User]
	
	String title
	String author
	String email
	String description
		
	static constraints = {
		title(blank: false)
		author(blank: false)
		description(blank: false)
		email(email: true)
	}
	
}
 