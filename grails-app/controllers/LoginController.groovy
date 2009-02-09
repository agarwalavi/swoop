/*
 * Licensed to Soaring Eagle L.L.C. under one or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information regarding copyright ownership.  Soaring Eagle L.L.C.
 * licenses this file to you under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations under the License.
 * Email Contact Scott Ryan scott@theryansplace.com
 */

import org.codehaus.groovy.grails.plugins.springsecurity.RedirectUtils
import org.grails.plugins.springsecurity.service.AuthenticateService

import org.springframework.security.DisabledException
import org.springframework.security.ui.AbstractProcessingFilter
import org.springframework.security.ui.openid.OpenIDConsumerException
import org.springframework.security.ui.webapp.AuthenticationProcessingFilter

/**
 * Login Controller (Example).
 */
class LoginController {

	/**
	 * Dependency injection for the authentication service.
	 */
	AuthenticateService authenticateService

	/**
	 * Dependency injection for OpenIDConsumer.
	 */
	def openIDConsumer

	/**
	 * Dependency injection for OpenIDAuthenticationProcessingFilter.
	 */
	def openIDAuthenticationProcessingFilter

	def index = {
		if (isLoggedIn()) {
			redirect(uri: '/')
		}
		else {
			redirect(action: auth, params: params)
		}
	}

	/**
	 * Show the login page.
	 */
	def auth = {
		nocache(response)
		if (isLoggedIn()) {
			redirect(uri: '/')
		}

		if (authenticateService.securityConfig.security.useOpenId) {
			render(view: 'openIdAuth')
		}
		else {
			render(view: 'auth')
		}
	}

	/**
	 * Form submit action to start an OpenID authentication.
	 */
	def openIdAuthenticate = {
		String openID = params['j_username']
		try {
			String returnToURL = RedirectUtils.buildRedirectUrl(
					request, response, openIDAuthenticationProcessingFilter.filterProcessesUrl)
			String redirectUrl = openIDConsumer.beginConsumption(request, openID, returnToURL)
			redirect(url: redirectUrl)
		}
		catch (OpenIDConsumerException e) {
			log.error "Consumer error: ${e.message}", e
			redirect(url: openIDAuthenticationProcessingFilter.authenticationFailureUrl)
		}
	}

	// Login page (function|json) for Ajax access.
	def authAjax = {
		nocache(response)
		//this is example:
		render """
		<script type='text/javascript'>
		(function() {
			loginForm();
		})();
		</script>
		"""
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess = {
		nocache(response)
		render '{success: true}'
	}

	/**
	 * Show denied page.
	 */
	def denied = {
		redirect(uri: '/')
	}

	// Denial page (data|view|json) for Ajax access.
	def deniedAjax = {
		//this is example:
		render "{error: 'access denied'}"
	}

	/**
	 * login failed
	 */
	def authfail = {

		def username = session[AuthenticationProcessingFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
		def msg = ''
		def exception = session[AbstractProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY]
		if (exception) {
			if (exception instanceof DisabledException) {
				msg = "[$username] is disabled."
			}
			else {
				msg = "[$username] wrong username/password."
			}
		}

		if (isAjax()) {
			render("{error: '${msg}'}")
		}
		else {
			flash.message = msg
			redirect(action: auth, params: params)
		}
	}

	/**
	 * Check if logged in.
	 */
	private boolean isLoggedIn() {
		def authPrincipal = authenticateService.principal()
		return authPrincipal != null && authPrincipal != 'anonymousUser'
	}

	private boolean isAjax() {
		return authenticateService.isAjax(request)
	}

	/** cache controls */
	private void nocache(response) {
		response.setHeader('Cache-Control', 'no-cache') // HTTP 1.1
		response.addDateHeader('Expires', 0)
		response.setDateHeader('max-age', 0) 
		response.setIntHeader ('Expires', -1) //prevents caching at the proxy server 
		response.addHeader('cache-Control', 'private') //IE5.x only
	}
}
