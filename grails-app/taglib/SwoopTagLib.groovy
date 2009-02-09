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

import org.codehaus.groovy.grails.plugins.web.taglib.FormTagLib

class SwoopTagLib
{
  def formatMoney = {attrs, body ->
    if (attrs.money != null)
    {
      out << new java.text.DecimalFormat('$#,##0;($#,##0)').format(attrs.money)
    }
    else
    {
      out << "N/A"
    }
  }
  def formatEnum = {attrs, body ->
    out << com.acig.acigweb.reference.EnumTranslator.translate(attrs.value)
  }
  def swoopFlash = {attrs, body ->
    out << render(template: "/shared/flash", model: [flash: attrs.flash])
  }
  def swoopOutputValue = {attrs, body ->
    out << render(template: "/shared/outputValue", model: [id: attrs.id, label: attrs.label, value: attrs.value, type: attrs.type, newline: attrs.newline, numberFormat: attrs.numberFormat])
  }
  def swoopInputText = {attrs, body ->
    out << render(template: "/shared/inputText", model: [label: attrs.label, size: attrs.size, maxlength: attrs.maxlength, addClass: attrs.addClass, bean: attrs.bean, field: attrs.field, required: attrs.required, inline: attrs.inline, type: attrs.type])
  }
  def swoopTextField = {attrs ->
    // If a controller returned the bean, and the field has an error,
    // then "errors" will be returned as HTML class, otherwise the class will be empty.
    attrs.class = hasErrors(bean: attrs.bean, field: attrs.field, 'errors')
    if (attrs.addClass != null && attrs.addClass.length() > 0)
    {
      attrs.class = attrs.class + " " + attrs.addClass
    }

    // Retrieves the field value of the given bean to be rendered in the view.
    // Note: specify the bean and not the bean name. So "${user}" instead of "user"
    attrs.value = fieldValue(bean: attrs.bean, field: attrs.field)
    // Required for textField taglib. attrs.name is a keyname of the params map
    attrs.name = attrs.field
    // renders the HTML tag
    out << new FormTagLib().textField(attrs)
  }
  def swoopPasswordField = {attrs ->
    // If a controller returned the bean, and the field has an error,
    // then "errors" will be returned as HTML class, otherwise the class will be empty.
    attrs.class = hasErrors(bean: attrs.bean, field: attrs.field, 'errors')
    if (attrs.addClass != null && attrs.addClass.length() > 0)
    {
      attrs.class = attrs.class + " " + attrs.addClass
    }

    // Retrieves the field value of the given bean to be rendered in the view.
    // Note: specify the bean and not the bean name. So "${user}" instead of "user"
    attrs.value = fieldValue(bean: attrs.bean, field: attrs.field)
    // Required for textField taglib. attrs.name is a keyname of the params map
    attrs.name = attrs.field
    // renders the HTML tag
    out << new FormTagLib().passwordField(attrs)
  }
}
