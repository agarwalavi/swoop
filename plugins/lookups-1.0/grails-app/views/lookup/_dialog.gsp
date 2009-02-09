                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="realm"><g:message code="lookup.realm" default="Realm" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'realm','errors')}">
                                    <input type="text" maxlength="100" id="realm" name="realm" value="${fieldValue(bean:lookup,field:'realm')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.realm" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codeType"><g:message code="lookup.codeType" default="Code Type" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'codeType','errors')}">
                                    <g:select id="codeType" name="codeType" from="${lookup.constraints.codeType.inList}" value="${lookup.codeType}" valueMessagePrefix="lookup.type" ></g:select>&nbsp;<g:lookupHelpBalloon code="lookup.codeType" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codeMinimum"><g:message code="lookup.codeMinimum" default="Code Minimum" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'codeMinimum','errors')}">
                                    <input type="text" id="codeMinimum" name="codeMinimum" value="${fieldValue(bean:lookup,field:'codeMinimum')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.codeMinimum" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codeMaximum"><g:message code="lookup.codeMaximum" default="Code Maximum" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'codeMaximum','errors')}">
                                    <input type="text" id="codeMaximum" name="codeMaximum" value="${fieldValue(bean:lookup,field:'codeMaximum')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.codeMaximum" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codeScale"><g:message code="lookup.codeScale" default="Code Scale" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'codeScale','errors')}">
                                    <input type="text" id="codeScale" name="codeScale" value="${fieldValue(bean:lookup,field:'codeScale')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.codeScale" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valueType"><g:message code="lookup.valueType" default="Value Type" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'valueType','errors')}">
                                    <g:select id="valueType" name="valueType" from="${lookup.constraints.valueType.inList}" value="${lookup.valueType}" valueMessagePrefix="lookup.type" ></g:select>&nbsp;<g:lookupHelpBalloon code="lookup.valueType" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valueMinimum"><g:message code="lookup.valueMinimum" default="Value Minimum" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'valueMinimum','errors')}">
                                    <input type="text" id="valueMinimum" name="valueMinimum" value="${fieldValue(bean:lookup,field:'valueMinimum')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.valueMinimum" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valueMaximum"><g:message code="lookup.valueMaximum" default="Value Maximum" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'valueMaximum','errors')}">
                                    <input type="text" id="valueMaximum" name="valueMaximum" value="${fieldValue(bean:lookup,field:'valueMaximum')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.valueMaximum" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valueScale"><g:message code="lookup.valueScale" default="Value Scale" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'valueScale','errors')}">
                                    <input type="text" id="valueScale" name="valueScale" value="${fieldValue(bean:lookup,field:'valueScale')}"/>&nbsp;<g:lookupHelpBalloon code="lookup.valueScale" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ordering"><g:message code="lookup.ordering" default="Ordering" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'ordering','errors')}">
                                    <g:select id="ordering" name="ordering" from="${lookup.constraints.ordering.inList}" value="${lookup.ordering}" valueMessagePrefix="lookup.ordering" ></g:select>&nbsp;<g:lookupHelpBalloon code="lookup.ordering" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="internationalize"><g:message code="lookup.internationalize" default="Internationalize" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookup,field:'internationalize','errors')}">
                                    <g:checkBox name="internationalize" value="${lookup?.internationalize}" ></g:checkBox>&nbsp;<g:lookupHelpBalloon code="lookup.internationalize" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
