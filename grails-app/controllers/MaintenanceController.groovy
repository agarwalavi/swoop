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

class MaintenanceController
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
    [maintenanceInstanceList: Maintenance.list(params)]
  }

  def show = {
    def maintenanceInstance = Maintenance.get(params.id)

    if (!maintenanceInstance)
    {
      flash.message = "Maintenance not found with id ${params.id}"
      redirect(action: list)
    }
    else
    { return [maintenanceInstance: maintenanceInstance] }
  }

  def delete = {
    def maintenanceInstance = Maintenance.get(params.id)
    if (maintenanceInstance)
    {
      maintenanceInstance.delete()
      flash.message = "Maintenance ${params.id} deleted"
      redirect(action: list)
    }
    else
    {
      flash.message = "Maintenance not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def edit = {
    def maintenanceInstance = Maintenance.get(params.id)

    if (!maintenanceInstance)
    {
      flash.message = "Maintenance not found with id ${params.id}"
      redirect(action: list)
    }
    else
    {
      return [maintenanceInstance: maintenanceInstance]
    }
  }

  def update = {
    def maintenanceInstance = Maintenance.get(params.id)
    if (maintenanceInstance)
    {
      maintenanceInstance.properties = params
      if (!maintenanceInstance.hasErrors() && maintenanceInstance.save())
      {
        flash.message = "Maintenance ${params.id} updated"
        redirect(action: show, id: maintenanceInstance.id)
      }
      else
      {
        render(view: 'edit', model: [maintenanceInstance: maintenanceInstance])
      }
    }
    else
    {
      flash.message = "Maintenance not found with id ${params.id}"
      redirect(action: edit, id: params.id)
    }
  }

  def create = {
    def maintenanceInstance = new Maintenance()
    maintenanceInstance.properties = params
    return ['maintenanceInstance': maintenanceInstance]
  }

  def save = {
    def maintenanceInstance = new Maintenance(params)
    if (!maintenanceInstance.hasErrors() && maintenanceInstance.save())
    {
      flash.message = "Maintenance ${maintenanceInstance.id} created"
      redirect(action: show, id: maintenanceInstance.id)
    }
    else
    {
      render(view: 'create', model: [maintenanceInstance: maintenanceInstance])
    }
  }
}
