package frittle

class User {
	
	String login
	String password
	String firstname
	String lastname

	static hasMany = [dashboards: Dashboard]
	
    static constraints = {
		login blank:false, size:5..15, matches:/[\S]+/, unique:true
		password blank:false, size:5..15, matches:/[\S]+/
		firstname blank:false
		lastname blank:false  
    }
}
