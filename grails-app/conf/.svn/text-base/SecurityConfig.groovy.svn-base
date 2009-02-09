security {
    defaultTargetUrl='/home'
    alwaysUseDefaultTargetUrl=true
	active = true
	// change to true to use OpenID authentication
	useOpenId = false
	// change to true and specify parameters to use LDAP/ActiveDirectory authentication
	useLdap = false
	//ldapServer = 'ldap://localhost:389' // 'ldap://ad.example.com', 'ldap://monkeymachine:389/dc=acegisecurity,dc=org'
	//ldapManagerDn = 'cn=admin,dc=example,dc=com'
	//ldapManagerPassword = 'secret'
	//ldapSearchBase = 'dc=example,dc=com' // 'ou=users,dc=example,dc=com'
	//ldapSearchFilter = '(uid={0})' //, '(mailNickname={0})'
	//ldapGroupSearchBase = 'ou=groups,dc=example,dc=com'
	//ldapGroupSearchFilter = 'uniquemember={0}'
	algorithm = 'MD5' 
	//use Base64 text ( true or false )
	encodeHashAsBase64 = false
	errorPage = null
	/** login user domain class name and fields */
	loginUserDomainClass = "User"
	userName = 'username'
	password = 'passwd'
	enabled = 'enabled'
	relationalAuthorities = 'authorities'
	/*
	 * You can specify method to retrieve the roles. (you need to set relationalAuthorities = null)
	 */
	// getAuthoritiesMethod = null //'getMoreAuthorities'
	/**
	 * Authority domain class authority field name
	 * authorityFieldInList
	 */
	authorityDomainClass = "Role"
	authorityField = 'authority'
	/** use RequestMap from DomainClass */
	useRequestMapDomainClass = false
	/** Requestmap domain class (if useRequestMapDomainClass = true) */
	requestMapClass = "Requestmap"
	requestMapPathField = 'url'
	requestMapConfigAttributeField = 'configAttribute'
	/** 
	 * if useRequestMapDomainClass is false, set request map pattern in string
	 * see example below
	 */
	requestMapString = """
		CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
		PATTERN_TYPE_APACHE_ANT
        /affiliate/**=IS_AUTHENTICATED_REMEMBERED
        /autoofferdetail/**=IS_AUTHENTICATED_REMEMBERED
        /bid/**=IS_AUTHENTICATED_REMEMBERED
        /bidder/**=IS_AUTHENTICATED_REMEMBERED
        /circular/**=IS_AUTHENTICATED_REMEMBERED
        /document/**=IS_AUTHENTICATED_REMEMBERED
        /home/**=IS_AUTHENTICATED_REMEMBERED
        /offer/**=IS_AUTHENTICATED_REMEMBERED
        /originator/**=IS_AUTHENTICATED_REMEMBERED
        /placeholder/**=IS_AUTHENTICATED_REMEMBERED
        /register/**=IS_AUTHENTICATED_REMEMBERED
        /report/**=IS_AUTHENTICATED_REMEMBERED
        /role/**=IS_AUTHENTICATED_REMEMBERED
        /subscription/**=IS_AUTHENTICATED_REMEMBERED
        /texttemplate/**=IS_AUTHENTICATED_REMEMBERED
        /trackedindex/**=IS_AUTHENTICATED_REMEMBERED
		/user/**=IS_AUTHENTICATED_REMEMBERED """
	/**
	 * To use email notification for user registration, set the following userMail to
	 * true and config your mail settings.Note you also need to run the script
	 * grails generate-registration.
	 */
	useMail = false
	//mailHost = 'localhost'
	//mailUsername = 'user@localhost'
	//mailPassword = 'sungod'
	//mailProtocol = 'smtp'
	//mailFrom = 'user@localhost'
	/** AJAX request header */
	//ajaxHeader = 'X-Requested-With'
	/** default user's role for user registration */
	defaultRole = 'ROLE_USER'
	/** use basicProcessingFilter */
	basicProcessingFilter = false
	/** use switchUserProcessingFilter */
	switchUserProcessingFilter = false
}
