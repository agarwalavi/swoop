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
class Assembly extends BaseDomain implements Serializable
{
  static constraints =
  {
    partNumber(nullable: false, blank: false)
    make(nullable: true, blank: true, validator: {val, obj ->
      return Lookup.valueFor("assembly.make", val) != null
    })
    model(nullable: true, blank: true, validator: {val, obj ->
      return Lookup.valueFor("assembly.model", val) != null
    })
    reportInterval(nullable: true, blank: true)
    reportIntervalType(nullable: true, blank: true, validator: {val, obj ->
      return Lookup.valueFor("report.intervalType", val) != null
    })
    requiresReport(nullable: false)
    size(nullable: true, blank: true, validator: {val, obj ->
      return Lookup.valueFor("assembly.size", val) != null
    })
  }
  /** A list of parts that can make up this assembly along with the list of possible vendor parts this could match up with           */
  static hasMany = [parts: PartInstance, vendorParts: VendorPart]
  /** The company part number for this assembly          */
  String partNumber
  /** The make of this assembly          */
  String make
  /** The model of this assembly         */
  String model
  /** The interval this assembly must be reported on          */
  BigDecimal reportInterval
  /** The interval type for reporting such as miles, hours, lbs. etc          */
  String reportIntervalType
  /** True is a report is required for this item          */
  Boolean requiresReport
  /** The size of this assembly          */
  String size
}
