
<%--
Copyright (C) MARCH-2014 Pivotal Software, Inc.

All rights reserved. This program and the accompanying materials
are made available under the terms of the under the Apache License,
Version 2.0 (the "License?); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="../css/isqlfire.css" />
    <link rel="stylesheet" type="text/css" href="../css/print.css" media="print" />
    <script src="../js/functions.js" type="text/javascript"></script>
    <SCRIPT language=Javascript>
        <!--
        function isNumberKey(evt)
        {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function validate(numcolumns)
        {
            for (var i = 1; i <= numcolumns; i++)
            {
                if (document.getElementById("parameter_name_" + i).value == "")
                {
                    alert("Procedure Paramater Name Cannot Be Empty");
                    return false;
                }
            }

            if (document.getElementById("procedureName").value == "")
            {
                alert("Procedure Name Cannot Be Empty");
                return false;
            }
            else if (document.getElementById("schemaName").value == "")
            {
                alert("Schema Name Cannot Be Empty");
                return false;
            }
            else if (document.getElementById("externalName").value == "")
            {
                alert("External Name Cannot Be Empty");
                return false;
            }
            else
            {
                return true;
            }
        }
        //-->
    </SCRIPT>
    <title><fmt:message key="sqlfireweb.appname" /> Create Procedure</title>
</head>
<body>

<h2><fmt:message key="sqlfireweb.appname" /> Create Procedure</h2>

<jsp:include page="toolbar.jsp" flush="true" />

<p>
    Creates a Java stored procedure that can be invoked using the CALL statement.
</p>

<c:if test="${!empty result}">
    <fieldset>
        <legend>Result</legend>
        <table class="formlayout">
            <tr>
                <td align="right">Command:</td>
                <td>${result.command} </td>
            </tr>
            <tr>
                <td align="right">Message:</td>
                <td>
                    <font color="${result.message == 'SUCCESS' ? 'green' : 'red'}">
                            ${result.message}
                    </font>
                </td>
            </tr>
        </table>
    </fieldset>
</c:if>

<c:if test="${!empty sql}">
    <div class="success">
        Successfully generated SQL
    </div>
    <h3>Create Procedure SQL </h3>
    <a href="javascript:history.back()">Return to Ensure Parameter Selection Not Lost</a>
    <br />
    <p />
    <table id="table_results" class="data">
        <tbody>
        <tr class="odd">
            <td><pre>${sql}</pre></td>
        </tr>
        </tbody>
    </table>
</c:if>

<h3>Procedure Properties</h3>

<form:form action="createprocedure" method="POST" modelAttribute="procedureAttribute" onsubmit="return validate(${numParams})">
Add
<input type="TEXT" name="numParams" size="4" value="1" onkeypress="return isNumberKey(event);" />
<input type="submit" name="pSubmit" value="Parameter(s)" />
<p />
<c:if test="${numParams > 0}">
    <table id="table_columns" class="data">
        <thead>
        <tr>
            <th colspan="4">Procedure Parameters</th>
        </tr>
        <tr>
            <th>Type</th>
            <th>Name</th>
            <th>Data Type</th>
            <th>Precision</th>
        </tr>
        </thead>
        <c:forEach var="row" varStatus="loop" begin="1" end="${numParams}" step="1">
            <tr class="${((loop.index % 2) == 0) ? 'even' : 'odd'}">
                <td>
                    <select name="parameter_type[]">
                        <option value="IN">IN</option>
                        <option value="INOUT">INOUT</option>
                        <option value="OUT">OUT</option>
                    </select>
                </td>
                <td><input type="text" id="parameter_name_${row}" name="parameter_name[]" size="15" maxlength="30" /></td>
                <td>
                    <select name="data_type[]">
                        <option value="INT">INT</option>
                        <option value="BIGINT">BIGINT</option>
                        <option value="BLOB">BLOB</option>
                        <option value="CHAR">CHAR</option>
                        <option value="CHAR FOR BIT DATA">CHAR FOR BIT DATA</option>
                        <option value="DATE">DATE</option>
                        <option value="DECIMAL">DECIMAL</option>
                        <option value="DOUBLE">DOUBLE</option>
                        <option value="DOUBLE PRECISION">DOUBLE PRECISION</option>
                        <option value="FLOAT">FLOAT</option>
                        <option value="INTEGER">INTEGER</option>
                        <option value="NUMERIC">NUMERIC</option>
                        <option value="REAL">REAL</option>
                        <option value="SMALLINT">SMALLINT</option>
                        <option value="TIME">TIME</option>
                        <option value="TIMESTAMP">TIMESTAMP</option>
                        <option value="VARCHAR">VARCHAR</option>
                        <option value="VARCHAR FOR BIT DATA">VARCHAR FOR BIT DATA</option>
                    </select>
                </td>
                <td><input type="text" name="column_precision[]" size="5" maxlength="30" onkeypress="return isNumberKey(event);"/></td>
            </tr>
        </c:forEach>
    </table>
    <br />
</c:if>
<table>
    <thead>
    <tr>
        <th colspan="3">Procedure Properties</th>
    </tr>
    </thead>
    <tbody>
    <tr class="even">
        <td align="right">Schema Name</td>
        <td>
            <form:input type="text" path="schemaName" size="20" maxlength="30" value="${sessionScope.schema}"  />
        </td>
        <td>Optional Schema Name, if omitted default to connected Schema</td>
    </tr>
    <tr class="odd">
        <td align="right">Procedure Name</td>
        <td>
            <form:input type="text" path="procedureName" size="20" maxlength="100" id="procedureName" />
        </td>
        <td>(Required) Procedure Name</td>
    </tr>
    <tr class="even">
        <td align="right">Language</td>
        <td>
            <form:select path="language">
               <form:option value="JAVA" selected="true" />
            </form:select>
        </td>
        <td>JAVA - the database manager will call the procedure as a public static method in a Java class</td>
    </tr>
    <tr class="odd">
        <td align="right">Parameter Style</td>
        <td>
            <form:select path="parameterStyle">
                <form:option value="JAVA" selected="true" />
            </form:select>
        </td>
        <td>JAVA - The procedure will use a parameter-passing convention that conforms to the Java language and SQL Routines specification</td>
    </tr>
    <tr class="even">
        <td align="right">SQL Access</td>
        <td>
            <form:select path="sqlAccess">
                <c:choose>
                    <c:when test="${procedureAttribute.sqlAccess == 'NO SQL'}">
                        <form:option selected="true" value="NO SQL" />
                    </c:when>
                    <c:otherwise>
                        <form:option value="NO SQL" />
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${procedureAttribute.sqlAccess == 'CONTAINS SQL'}">
                        <form:option selected="true" value="CONTAINS SQL" />
                    </c:when>
                    <c:otherwise>
                        <form:option value="CONTAINS SQL" />
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${procedureAttribute.sqlAccess == 'READS SQL DATA'}">
                        <form:option selected="true" value="READS SQL DATA" />
                    </c:when>
                    <c:otherwise>
                        <form:option value="READS SQL DATA" />
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${procedureAttribute.sqlAccess == 'MODIFIES SQL DATA'}">
                        <form:option selected="true" value="MODIFIES SQL DATA" />
                    </c:when>
                    <c:otherwise>
                        <form:option value="MODIFIES SQL DATA" />
                    </c:otherwise>
                </c:choose>
            </form:select>
        </td>
        <td>Indicates whether the stored procedure issues any SQL statements and, if so, what type. </td>
    </tr>
    <tr class="odd">
        <td align="right">Result Sets</td>
        <td>
            <form:input type="text" path="dynamicResultsets" size="20" maxlength="10" onkeypress="return isNumberKey(event);" />
        </td>
        <td>Indicates the estimated upper bound of returned result sets for the procedure</td>
    </tr>
    <tr class="even">
        <td align="right">External Name</td>
        <td>
            <form:input type="text" path="externalName" size="20" maxlength="300" id="externalName"  />
        </td>
        <td>Required: String describes the fully Qualified Java method to be called when the procedure is executed</td>
    </tr>
    </tbody>
</table>
    <br />
    <input type="submit" value="Create" name="pSubmit" />
    <input type="submit" value="Show SQL" name="pSubmit" />
    <input type="submit" value="Save to File" name="pSubmit" />
</form:form>

<br />

<jsp:include page="footer.jsp" flush="true" />

</body>
</html>