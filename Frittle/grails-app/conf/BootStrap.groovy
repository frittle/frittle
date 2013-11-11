import frittle.Dashboard

class BootStrap {
	
	def init = { servletContext ->
		// Check whether the test data already exists.
		if (!Dashboard.count()) {
			new Dashboard(author: "Marc", title: "Frittle", description: "This is a test", email: "marcdix0@gmail.com").save(failOnError: true)
		}
	}

	def destroy = {
	}
}
