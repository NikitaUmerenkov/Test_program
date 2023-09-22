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


<cfquery datasource= "your_database">
    INSERT INTO users (username, first_name, last_name, password)
    VALUES (
        <cfqueryparam value="#form.username#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.first_name#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.last_name#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.password#" cfsqltype="CF_SQL_VARCHAR">
    )
</cfquery>
<cflocation url="index.cfm?action=userList">