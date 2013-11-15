package frittle

import grails.converters.JSON;

import org.codehaus.groovy.grails.web.json.JSONObject
import org.springframework.dao.DataIntegrityViolationException

class DashboardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		def criteria = Dashboard.withCriteria {
			users {
				eq('login', session.user.login)
			}
		}
		def dashboards = criteria.findAll()
		[dashboardInstanceList: dashboards, dashboardInstanceTotal: Dashboard.count()]
    }

    def create() {
        [dashboardInstance: new Dashboard(params)]
    }
	
	def findDashboardsByUser() {
		def criteria = Dashboard.withCriteria {
			users {
				eq('login', session.user.login)
			}
		}
		def dashboards = criteria.findAll()
		return dashboards
	} 
 
    def save() {
		User user = User.findByLogin(session.user?.login)
		
        def dashboardInstance = new Dashboard(params)
		user.dashboards += dashboardInstance
		
        if (!user.save(flush: true)) {
            render(view: "create", model: [dashboardInstance: dashboardInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), dashboardInstance.id])
        redirect(action: "show", id: dashboardInstance.id)
    }

    def show(Long id) {
        def dashboardInstance = Dashboard.get(id)
        if (!dashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
            redirect(action: "list")
            return
        }
        [dashboardInstance: dashboardInstance]
    }
	
	def showIt(Long id) {
		def dashboardInstance = Dashboard.get(id)
		if (!dashboardInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
			redirect(action: "list")
			return
		}
		render (dashboardInstance as JSON)
	}
	
	def processJSON() {
		Card object = JSON.parse(params.jsondata)
		println object.username
		render (object as JSON)
	}

	def processCardMove() {
		JSONObject  object = JSON.parse(params.jsondata)
		String id  = object.getString("id")
		String column  = object.getString("column")
		
		println "Card met id " + id + " is verplaatst naar kolom " + column + "!"
		 
		render (object as JSON)
	}

    def edit(Long id) {
        def dashboardInstance = Dashboard.get(id)
        if (!dashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
            redirect(action: "list")
            return
        }

        [dashboardInstance: dashboardInstance]
    }

    def update(Long id, Long version) {
        def dashboardInstance = Dashboard.get(id)
        if (!dashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dashboardInstance.version > version) {
                dashboardInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dashboard.label', default: 'Dashboard')] as Object[],
                          "Another user has updated this Dashboard while you were editing")
                render(view: "edit", model: [dashboardInstance: dashboardInstance])
                return
            }
        }

        dashboardInstance.properties = params

        if (!dashboardInstance.save(flush: true)) {
            render(view: "edit", model: [dashboardInstance: dashboardInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), dashboardInstance.id])
        redirect(action: "show", id: dashboardInstance.id)
    }

    def delete(Long id) {
        def dashboardInstance = Dashboard.get(id)
        if (!dashboardInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
            redirect(action: "list")
            return
        }

        try {
            dashboardInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dashboard.label', default: 'Dashboard'), id])
            redirect(action: "show", id: id)
        }
    }
	
}
