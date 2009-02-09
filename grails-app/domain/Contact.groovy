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
class Contact implements Serializable
{
  static constraints =
  {
    firstName(nullable: false, blank: false, maxSize: 100)
    lastName(nullable: false, blank: false, maxSize: 100)
    title(nullable: true, blank: true, maxSize: 100)
    phone(nullable: false, blank: false, maxSize: 25)
    mobilePhone(nullable: true, blank: true, maxSize: 25)
    emailAddress(nullable: false, blank: false, maxSize: 255, email: true)
    fax(nullable: true, blank: true, maxSize: 25)
  }
  String firstName
  String lastName
  String title
  String phone
  String mobilePhone
  String emailAddress
  String fax
}