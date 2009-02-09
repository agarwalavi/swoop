import org.grails.plugins.springsecurity.service.AuthenticateService


public class SecurityFilters
{
  def authenticateService
  def filters = {
    securityFilter(controller: '*', action: '*') {
      before = {
        // Don't handle login and logout as those are not protected
        if (controllerName == "login" || controllerName == "logout" || (controllerName == 'home' && actionName == null))
        {
          return true
        }
        // If this is settings then let master admin use it
        if (controllerName == 'setting' || controllerName == 'lookup' || controllerName == 'lookupValue')
        {
          if (authenticateService?.ifAnyGranted(Role.MASTER_ADMIN))
          {
            return true
          }
          else
          {
            // Authority not granted
            flash?.error = "You are not authorized to perform the requested action(10023)"
            log?.error "Authorization Error (10023) for controller " + newName + " and action " + actionName + " for user " + user?.username
            redirect(controller: 'home', action: 'home')
            return false
          }
        }
        def newName = controllerName?.replaceFirst(controllerName[0], controllerName[0]?.toUpperCase());
        newName = newName + "Controller"
        def controllerClass = grailsApplication?.classLoader?.loadClass(newName)
        def user = authenticateService?.userDomain()
        try
        {

          // TODO log the offending user
          if (controllerClass?.authorizations != null)
          {
            def auths = controllerClass?.authorizations[actionName]

            def authCount = 0
            def authString = ""
            auths?.each {
              authCount++
              if (authCount == 1)
              {
                authString = authString + it
              }
              else
              {
                authString = authString + "," + it
              }
            }
            if (authenticateService?.ifAnyGranted(authString))
            {
              return true
            }
            else
            {
              // Authority not granted
              flash?.error = "You are not authorized to perform the requested action(10023)"
              log?.error "Authorization Error (10023) for controller " + newName + " and action " + actionName + " for user " + user?.username
              redirect(controller: 'home', action: 'home')
              return false
            }
          }
          else
          {
            // Null authorizations on the controller
            flash?.error = "You are not authorized to perform the requested action(10024)"
            log?.error "Authorization Error (10024) for controller " + newName + " and action " + actionName + " for user " + user?.username
            redirect(controller: 'home', action: 'home')
            return false;
          }
        }
        catch (MissingPropertyException)
        {
          // No authorizations property on controller
          flash?.error = "You are not authorized to perform the requested action(10025)"
          log?.error "Authorization Error (10025) for controller " + newName + " and action " + actionName + " for user " + user?.username
          redirect(controller: 'home', action: 'home')
          return false
        }
        log.error " Total Authorization failure(10026) for controller " + newName + " and action " + actionName + " for user " + user?.username
        return false
      }
    }
  }
}