package frittle

class Card {

	String username
	String usernameShort
	String text
	String discipline
	String column
	
	static belongsTo = Dashboard
	
    static constraints = {
    }
}
