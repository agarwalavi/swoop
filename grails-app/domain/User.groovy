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
class User extends BaseDomain implements Serializable
{
  static transients = ['pass', 'confirmPassword']
  static constraints =
  {
    username(nullable: false, blank: false, unique: true, maxSize: 100)
    passwd(nullable: false, blank: false, maxSize: 50)
    companyName(nullable: true, blank: true, maxSize: 100)
    mailAddress(nullable: false)
    contact(nullable: false)
    enabled(nullable: false)
    location(nullable:true)
  }
  static hasMany = [authorities: Role]
  static mapping = {
    // This is reversed on purpose to support grails 1.0.4 mapping bug
    authorities(column: 'user_id')
  }

  static embedded = ['mailAddress', 'contact']
  /** Username  */
  String username
  /** MD5 Password  */
  String passwd
  /** The mailing address for the user  */
  Address mailAddress = new Address()
  /** The optional company name for the user  */
  String companyName
  /** Common contact information for the user  */
  Contact contact = new Contact()
  /** enabled  */
  boolean enabled = true
  /** plain password to create a MD5 password  */
  String pass = '[secret]'

  String confirmPassword

  Location location

  def getFullName()
  {
    contact.firstName + " " + contact.lastName
  }
}






