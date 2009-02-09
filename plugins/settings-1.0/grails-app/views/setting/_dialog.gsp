<div class="dialog">
    <table>
        <tbody>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="code"><g:message code="setting.code" default="Code" />:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:setting,field:'code','errors')}">
                    <input type="text" id="code" name="code" value="${fieldValue(bean:setting,field:'code')}"/>&nbsp;<g:settingHelpBalloon code="setting.code" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="type"><g:message code="setting.type" default="Type" />:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:setting,field:'type','errors')}">
                    <g:select id="type" name="type" from="${setting.constraints.type.inList}" value="${setting.type}" valueMessagePrefix="setting.type" ></g:select>&nbsp;<g:settingHelpBalloon code="setting.type" />
                </td>
            </tr>

            <tr class="prop">
                <td valign="top" class="name">
                    <label for="value"><g:message code="setting.value" default="Value" />:</label>
                </td>
                <td valign="top" class="value ${hasErrors(bean:setting,field:'value','errors')}">
                    <input type="text" id="value" name="value" value="${fieldValue(bean:setting,field:'value')}"/>&nbsp;<g:settingHelpBalloon code="setting.value" />
                </td>
            </tr>

        </tbody>
    </table>
</div>
