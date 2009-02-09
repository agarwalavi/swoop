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
class AssemblyInstance extends BaseDomain implements Serializable
{
  static constraints =
  {
    active(nullable: false)
    actualCost(nullable: false)
    assembly(nullable: false)
    /** This is either on a vehicle on in inventory at a location    */
    vehicle(nullable: true)
    location(nullable: true)
    vendorPart(nullable: false)
    serialNumber(nullable: true, blank: true)
    sku(nullable: true, blank: true)
    dateReceived(nullable: false)
    dateChanged(nullable: true)
    notes(nullable: true, blank: true)
    order(nullable: true)
  }
  /** THe list of parts that make up this instance along with any service requests associated with this instance.    */
  static hasMany = [parts: PartInstance, sercviceRequests: ServiceRequest]
  /** true if this assembly instance is still active on a vehicle or in inventory     */
  Boolean active
  /** This actual cost of this assembly when it was received     */
  BigDecimal actualCost
  /** This assembly this instance was created from     */
  Assembly assembly
  /** This instance is either attached to a vehicle or in inventory at a location     */
  Vehicle vehicle
  /** Location if in Inventory     */
  Location location
  /** The vendor part this instance is     */
  VendorPart vendorPart
  /** The serial number of this assembly     */
  String serialNumber
  /** This sku for this specific item     */
  String sku
  /** The date this instance was received into inventory via an order     */
  Date dateReceived
  /** The date this instance changed status     */
  Date dateChanged
  /** Any notes about this specific instance     */
  String notes
  /** The order that this instance was received under   */
  Order order
}
