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

<cfquery datasource="your_database">
    INSERT INTO errors (number, date, short_description, detailed_description, user, status, urgency, severity)
    VALUES (
        <cfqueryparam value="#form.number#" cfsqltype="CF_SQL_integer">,
        <cfqueryparam value="#form.date#" cfsqltype="CF_SQL_DATE">,
        <cfqueryparam value="#form.short_description#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.detailed_description#" cfsqltype="CF_SQL_LONGVARCHAR">,
        <cfqueryparam value="#form.user#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.status#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.urgency#" cfsqltype="CF_SQL_VARCHAR">,
        <cfqueryparam value="#form.severity#" cfsqltype="CF_SQL_VARCHAR">
    )
</cfquery>
<cflocation url="menu.cfm?action=errorList">