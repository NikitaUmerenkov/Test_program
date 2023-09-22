<!---Подключение драйвера для работы с БД--->

<cfset driver = "com.mysql.jdbc.Driver">
<cfset connectionString = "jdbc:mysql://localhost:3306/your_database">
<cfset username = "root">
<cfset password = "">

<cftry>
    <cfset driverObj = createObject("java", driver).init()>
    <cfset props = createObject("java", "java.util.Properties").init()>
    <cfset props.setProperty("user", username)>
    <cfset props.setProperty("password", password)>
    <cfset conn = driverObj.connect(connectionString, props)>
    
    <cfcatch>
        <cfoutput>
            Ошибка подключения к базе данных: #cfcatch.message#
        </cfoutput>
    </cfcatch>
</cftry>




<h2>Список ошибок</h2>

<cfquery name="getErrors" datasource="your_database">
    SELECT number, date, short_description, detailed_description, user, status, urgency, severity
    FROM errors
</cfquery>

<!DOCTYPE html>
<html>
<head>
    <title>Error List</title>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1>Лист ошибок</h1>
    <table>
        <tr>
            <th>Номер</th>
            <th>Дата</th>
            <th>Короткое описание</th>
            <th>Подробное описание</th>
            <th>Пользователь</th>
            <th>Статус</th>
            <th>Срочность</th>
            <th>Критичность</th>
        </tr>
        <cfoutput query="getErrors">
            <tr>
                <td>#number#</td>
                <td>#dateformat(date, "mm/dd/yyyy")#</td>
                <td>#short_description#</td>
                <td>#replace(detailed_description, chr(13) & chr(10), "<br>", "all")#</td>
                <td>#user#</td>
                <td>#status#</td>
                <td>#urgency#</td>
                <td>#severity#</td>
            </tr>
        </cfoutput>
    </table>
</body>
</html>

<h2><a href="menu.cfm?action=new_error">Меню</a></h2>