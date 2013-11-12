import frittle.Card
import frittle.Dashboard
import frittle.User

class BootStrap {
	def init = { servletContext ->
		// Check whether the test data already exists.
		if (!User.count()) {
			new User(login: "marcdix", password: "geheim1234", firstname: "marc", lastname: "dix", dashboards: [
				new Dashboard(author: "Marc", title: "Frittle", description: "This is a test", email: "marcdix0@gmail.com",
					cards: [
						new Card(username: "marc", usernameShort: "MD", text: "bootstrap", discipline: "bouw", column: "TODO"),
						new Card(username: "erik", usernameShort: "EV", text: "presentatie deel 3", discipline: "bouw", column: "TODO"),
						new Card(username: "leo", usernameShort: "LA", text: "presentatie deel 4", discipline: "bouw", column: "TODO"),
						new Card(username: "oscar", usernameShort: "AB", text: "ontwerp", discipline: "ontwerp", column: "TODO"),
						new Card(username: "marc", usernameShort: "MD", text: "domein model deel 2", discipline: "bouw", column: "DOING"),
						new Card(username: "marc", usernameShort: "MD", text: "bootstrap data", discipline: "bouw", column: "DOING"),
						new Card(username: "marc", usernameShort: "EV", text: "presentatie deel 1", discipline: "bouw", column: "DOING"),
						new Card(username: "marc", usernameShort: "LA", text: "presentatie deel 2", discipline: "bouw", column: "DOING"),
						new Card(username: "marc", usernameShort: "MD", text: "domein model deel 1", discipline: "bouw", column: "DONE")
						]
					)
				] ).save(failOnError: true)
		}
	}

	def destroy = {
	}
}
