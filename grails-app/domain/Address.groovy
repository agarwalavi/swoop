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
class Address implements Serializable
{
  static constraints =
  {
    addressLineOne(nullable: false, blank: false, maxSize: 100)
    addressLineTwo(nullable: true, blank: true, maxSize: 100)
    city(nullable: false, blank: false, maxSize: 100)
    province(nullable: false, blank: false)
    postalCode(nullable: false, blank: false, maxSize: 25)
  }
  String addressLineOne
  String addressLineTwo
  String city
  String province
  String postalCode
}