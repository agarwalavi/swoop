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

class OrderController
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
    [orderInstanceList: Order.list(params)]
  }

  def show = {
    def orderInstance = Order.get(params.id)

    if (!orderInstance)
    {
      flash.message = "Order not found with id ${params.id}"
      redirect(action: list)
    }
    else
    { return [orderInstance: orderInstance] }
  }

  def delete = {
    def orderInstance = Order.get(params.id)
    if (orderInstance)
    {
      orderInstance.delete()
      flash.message = "Order ${params.id} deleted"
      redirect(action: list)
    }
    else
    {
      flash.message = "Order not found with id ${params.id}"
      redirect(action: list)
    }
  }

  def edit = {
    def orderInstance = Order.get(params.id)

    if (!orderInstance)
    {
      flash.message = "Order not found with id ${params.id}"
      redirect(action: list)
    }
    else
    {
      return [orderInstance: orderInstance]
    }
  }

  def update = {
    def orderInstance = Order.get(params.id)
    if (orderInstance)
    {
      orderInstance.properties = params
      if (!orderInstance.hasErrors() && orderInstance.save())
      {
        flash.message = "Order ${params.id} updated"
        redirect(action: show, id: orderInstance.id)
      }
      else
      {
        render(view: 'edit', model: [orderInstance: orderInstance])
      }
    }
    else
    {
      flash.message = "Order not found with id ${params.id}"
      redirect(action: edit, id: params.id)
    }
  }

  def create = {
    def orderInstance = new Order()
    orderInstance.properties = params
    return ['orderInstance': orderInstance]
  }

  def save = {
    def orderInstance = new Order(params)
    if (!orderInstance.hasErrors() && orderInstance.save())
    {
      flash.message = "Order ${orderInstance.id} created"
      redirect(action: show, id: orderInstance.id)
    }
    else
    {
      render(view: 'create', model: [orderInstance: orderInstance])
    }
  }
}
