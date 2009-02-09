                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lookup"><g:message code="lookupValue.lookup" default="Lookup" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookupValue,field:'lookup','errors')}">
                                    <g:select optionKey="id" from="${Lookup.list(sort: 'realm')}" name="lookup.id" value="${lookupValue?.lookup?.id}" ></g:select>&nbsp;<g:lookupHelpBalloon code="lookupValue.lookup" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="lookupValue.code" default="Code" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookupValue,field:'code','errors')}">
                                    <input type="text" maxlength="100" id="code" name="code" value="${fieldValue(bean:lookupValue,field:'code')}"/>&nbsp;<g:lookupHelpBalloon code="lookupValue.code" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value"><g:message code="lookupValue.value" default="Value" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookupValue,field:'value','errors')}">
                                    <input type="text" maxlength="100" id="value" name="value" value="${fieldValue(bean:lookupValue,field:'value')}"/>&nbsp;<g:lookupHelpBalloon code="lookupValue.value" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sequencer"><g:message code="lookupValue.sequencer" default="Sequencer" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:lookupValue,field:'sequencer','errors')}">
                                    <input type="text" id="sequencer" name="sequencer" value="${fieldValue(bean:lookupValue,field:'sequencer')}"/>&nbsp;<g:lookupHelpBalloon code="lookupValue.sequencer" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
