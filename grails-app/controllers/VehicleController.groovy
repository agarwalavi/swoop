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
class VehicleController
{
  static authorizations = [
          index: [Role.MASTER_ADMIN],
          list: [Role.MASTER_ADMIN],
          show: [Role.MASTER_ADMIN],
          delete: [Role.MASTER_ADMIN],
          edit: [Role.MASTER_ADMIN],
          update: [Role.MASTER_ADMIN],
          create: [Role.MASTER_ADMIN],
          save: [Role.MASTER_ADMIN]
  ]
  def index = { redirect(action: list, params: params) }

  // the delete, save and update actions only accept POST requests
  def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

  def list = {
    if (!params.max) params.max = 10
    [vehicleInstanceList: Vehicle.list(params)]
  }

  def show = {
    def vehicleInstance = Vehicle.get(params.id)

    if (!vehicleInstance)
    {
      flash.message = "Vehicle not found with id ${params.id}"
      redirect(action: list)
    }
    else
    { return [vehicleInstance: vehicleInstance] }
  }

  def delete = {
    def vehicleInstance = Vehicle.get(params.id)
    if (vehicleInstance)
    {
      vehicleInstance.delete()
      flash.message = "Vehicle ${params.id} deleted"
      redirect(action: list)
    }
    else
    {
      flash.message = "Vehicle not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def edit = {
    def vehicleInstance = Vehicle.get(params.id)

    if (!vehicleInstance)
    {
      flash.message = "Vehicle not found with id ${params.id}"
      redirect(action: list)
    }
    else
    {
      return [vehicleInstance: vehicleInstance]
    }
  }

  def update = {
    def vehicleInstance = Vehicle.get(params.id)
    if (vehicleInstance)
    {
      vehicleInstance.properties = params
      if (!vehicleInstance.hasErrors() && vehicleInstance.save())
      {
        flash.message = "Vehicle ${params.id} updated"
        redirect(action: show, id: vehicleInstance.id)
      }
      else
      {
        render(view: 'edit', model: [vehicleInstance: vehicleInstance])
      }
    }
    else
    {
      flash.message = "Vehicle not found with id ${params.id}"
      redirect(action: edit, id: params.id)
    }
  }

  def create = {
    def vehicleInstance = new Vehicle()
    vehicleInstance.properties = params
    return ['vehicleInstance': vehicleInstance]
  }

  def save = {
    def vehicleInstance = new Vehicle(params)
    if (!vehicleInstance.hasErrors() && vehicleInstance.save())
    {
      flash.message = "Vehicle ${vehicleInstance.id} created"
      redirect(action: show, id: vehicleInstance.id)
    }
    else
    {
      render(view: 'create', model: [vehicleInstance: vehicleInstance])
    }
  }
}
