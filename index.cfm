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


<!DOCTYPE html>
<html>
<head>
    <title>Система учета ошибок</title>
</head>
<body>
    <h1>Система учета ошибок</h1>



    <cfif NOT IsDefined("session.user")>
        <cfinclude template="login.cfm">
    <cfelse>
        <cfinclude template="menu.cfm">
        <cfswitch expression="#url.action#">
            <cfcase value="newError">
                <cfinclude template="newError.cfm">
            </cfcase>
            <cfcase value="errorList">
                <cfinclude template="errorList.cfm">
            </cfcase>
            <cfcase value="newUser">
                <cfinclude template="newUser.cfm">
            </cfcase>
            <cfcase value="userList">
                <cfinclude template="userList.cfm">
            </cfcase>
            <cfcase value="logout">
                <cfset session.user = "">
                <cflocation url="index.cfm">
            </cfcase>
            <cfdefaultcase>
                <cfinclude template="errorList.cfm">
            </cfdefaultcase>
        </cfswitch>
    </cfif>
</body>
</html>