import frittle.Card
import frittle.Dashboard
import frittle.User

class BootStrap {
	def init = { servletContext ->
		// Check whether the test data already exists.
		if (!User.count()) {
			new User(login: "marcdix", password: "geheim1234", firstname: "marc", lastname: "dix", dashboards: [
				new Dashboard(author: "Marc", title: "Dagbord JIG", description: "Frittle Dashboard", email: "marcdix0@gmail.com",
					cards: [
						new Card(username: "Marc", usernameShort: "MD", text: "bootstrap", discipline: "bouw", column: "TODO"),
						new Card(username: "Erik", usernameShort: "EV", text: "presentatie deel 3", discipline: "bouw", column: "TODO"),
						new Card(username: "Leo", usernameShort: "LA", text: "presentatie deel 4", discipline: "bouw", column: "TODO"),
						new Card(username: "Oskar", usernameShort: "OB", text: "ontwerp", discipline: "ontwerp", column: "TODO"),
						new Card(username: "Marc", usernameShort: "MD", text: "domein model deel 2", discipline: "bouw", column: "DOING"),
						new Card(username: "Marc", usernameShort: "MD", text: "bootstrap data", discipline: "bouw", column: "DOING"),
						new Card(username: "Marc", usernameShort: "EV", text: "presentatie deel 1", discipline: "bouw", column: "DOING"),
						new Card(username: "Marc", usernameShort: "LA", text: "presentatie deel 2", discipline: "bouw", column: "DOING"),
						new Card(username: "Marc", usernameShort: "MD", text: "domein model deel 1", discipline: "bouw", column: "DONE")
						]
					), 
				new Dashboard(author: "Marc", title: "Other project", description: "Some other project", email: "marcdix0@gmail.com",
					cards: [
						new Card(username: "adnan", usernameShort: "MD", text: "presenetatie", discipline: "bouw", column: "TODO"),
						new Card(username: "bart", usernameShort: "EV", text: "plan", discipline: "project manager", column: "TODO"),
						new Card(username: "leo", usernameShort: "LA", text: "presentate", discipline: "bouw", column: "TODO"),
						]
					)
				] ).save(failOnError: true)
				
				new User(login: "leoaarnink", password: "geheim1234", firstname: "leo", lastname: "aarnink", dashboards: [
					new Dashboard(author: "Marc", title: "Frittle", description: "Some other Dashboard", email: "marcdix0@gmail.com",
						cards: [
							new Card(username: "erik", usernameShort: "MD", text: "bootstrap", discipline: "bouw", column: "TODO"),
							new Card(username: "leo", usernameShort: "EV", text: "presentatie deel 1", discipline: "bouw", column: "DOING"),
							new Card(username: "marc", usernameShort: "LA", text: "presentatie deel 2", discipline: "bouw", column: "DONE"),
							]
						)
					] ).save(failOnError: true)
		}
	}

	def destroy = {
	}
}
