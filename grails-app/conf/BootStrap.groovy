import org.codehaus.groovy.grails.commons.GrailsApplication
import grails.util.GrailsUtil

class BootStrap
{
  def init =
  {servletContext ->
    if (GrailsUtil.environment == 'seeddata')
    {
      createRoles()
      createUsers()
      createReference()
    }
    if (GrailsUtil.environment == 'newdata')
    {
      createRoles()
      createUsers()
      createReference()
      createLocation()
    }
    if (GrailsUtil.environment == GrailsApplication.ENV_PRODUCTION)
    {
      //createAdminUser()
    }
    def destroy =
    {
    }
  }

  void createRoles()
  {
    Role role = new Role()
    role.authority = "ROLE_MASTER_ADMIN"
    role.description = "Overall Administator for the System"
    role.save()

    role = new Role()
    role.authority = "ROLE_SWOOP_USER"
    role.description = "User of the AXS System"
    role.save()
  }


  void createUsers()
  {
    User user = new User()
    user.username = "admin"
    user.passwd = "21232f297a57a5a743894a0e4a801fc3"
    user.enabled = true
    user.contact.firstName = "Scott"
    user.contact.lastName = "Ryan"
    user.contact.phone = "3032633044"
    user.contact.mobilePhone = "3032630344"
    user.contact.emailAddress = "scott@theryansplace.com"
    user.companyName = "Soaring Eagle L.L.C."
    user.mailAddress.addressLineOne = "47 Park Ave"
    user.mailAddress.city = "Long Beach"
    user.mailAddress.province = "CA"
    user.mailAddress.postalCode = "90803"

    user.authorities = [Role.get(1)]
    if (!user.save())
    {
      user.errors.allErrors.each {
        println it
      }
    }
  }

  void createReference()
  {
    // Provinces
    def lookup = createLookup("province", "string", "string")
    createLookupValue(lookup, "CO", "CO")
    // Vehicle Makes
    lookup = createLookup("vehicle.make", "string", "string")
    createLookupValue(lookup, "FORD", "FORD")
  }

  def createLookup(def inRealm, def inCodeType, def inValueType)
  {
    Lookup lookup = new Lookup()
    lookup.internationalize = true
    lookup.realm = inRealm
    lookup.codeType = inCodeType
    lookup.valueType = inValueType
    lookup.ordering = "code"

    if (!lookup.save())
    {
      lookup.errors.allErrors.each {
        println it
      }
    }
    return lookup
  }

  void createLookupValue(def inLookup, def inCode, def inValue)
  {
    LookupValue value = new LookupValue()
    value.code = inCode
    value.value = inValue
    value.lookup = inLookup

    if (!value.save())
    {
      value.errors.allErrors.each {
        println it
      }
    }
  }


  void createLocation()
  {
    Location location = new Location()
    location.address.addressLineOne = "1 Park Street"
    location.address.city = "Denver"
    location.address.province = "CO"
    location.address.postalCode = " 80123"
    location.mailAddress.addressLineOne = "1 Park Street"
    location.mailAddress.city = "Denver"
    location.mailAddress.province = "CO"
    location.mailAddress.postalCode = " 80123"
    location.manager = User.get(1)
    location.companyId = "123"
    location.name = "Location One"
    location.primaryPhone = "5555555555"
    location.emailAddress = "info@mail.info"
    if (!location.save())
    {
      location.errors.allErrors.each {
        println it
      }
    }
  }
}