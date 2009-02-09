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

class RoleController extends BaseController
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
  // the delete, save and update actions only accept POST requests
  def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

  def index = {
    redirect(action: list, params: params)
  }

  def list = {
    if (!params.max) params.max = 10
    if (ifNotGranted("ROLE_MASTER_ADMIN"))
    {
      flash.message = "You are not authorized to list roles"
      redirect(controller: "home")
      return
    }

    [authorityList: Role.list(params)]
  }

  def show = {
    [authority: Role.get(params.id)]
  }

  def delete = {
    def authority = Role.get(params.id)
    if (!authority)
    {
      flash.message = "Role not found with id ${params.id}"
      redirect(action: list)
      return
    }

    String oldRole = authority.authority
    authority.delete()
    flash.message = "Role ${params.id} deleted."
    redirect(action: list)
  }

  def edit = {
    def authority = Role.get(params.id)
    if (!authority)
    {
      flash.message = "Role not found with id ${params.id}"
      redirect(action: list)
      return
    }

    [authority: authority]
  }

  /**
   * Authority update action. When updating an existing authority instance, the requestmaps which contain
   * them should also be updated.
   */
  def update = {
    def authority = Role.get(params.id)
    if (!authority)
    {
      flash.message = "Role not found with id ${params.id}"
      redirect(action: edit, id: params.id)
      return
    }

    String oldRole = authority.authority
    authority.properties = params
    String role = params.authority
    authority.authority = 'ROLE_' + role.toUpperCase()
    String newRole = authority.authority
    if (authority.save())
    {
      redirect(action: show, id: authority.id)
    }
    else
    {
      render(view: 'edit', model: [authority: authority])
    }
  }

  def create = {
    def authority = new Role()
    authority.authority = ''
    authority.properties = params
    [authority: authority]
  }

  /**
   * Authority save action.
   */
  def save = {
    def authority = new Role()
    String au = params.authority
    authority.properties = params
    //here translate user's input to the required format
    authority.authority = 'ROLE_' + au.toUpperCase()
    if (authority.save())
    {
      redirect(action: show, id: authority.id)
    }
    else
    {
      render(view: 'create', model: [authority: authority])
    }
  }
}
