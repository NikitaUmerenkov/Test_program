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




<cfquery name="getUserList" datasource="your_database">
    SELECT username, first_name, last_name
    FROM users
</cfquery>

<!DOCTYPE html>
<html>
<head>
    <title>Пользователи</title>
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
    <h1>User List</h1>
    <table>
        <thead>
            <tr>
                <th>Пользователь</th>
                <th>Имя</th>
                <th>Фамилия</th>
            </tr>
        </thead>
        <tbody>
            <cfoutput query="getUserList">
                <tr>
                    <td>#username#</td>
                    <td>#first_name#</td>
                    <td>#last_name#</td>
                </tr>
            </cfoutput>
        </tbody>
    </table>
</body>
</html>

<h2><a href="menu.cfm?action=new_error">Меню</a></h2>