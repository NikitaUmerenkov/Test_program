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

<cfform>
<cfinput type="text" name="username" placeholder="Введите имя пользователя">
<cfinput type="submit" value="Проверить" name="submit">
</cfform>

<cfif structKeyExists(form, "username")>
    <cfquery name="updateUser" datasource="your_database">
        SELECT * FROM users WHERE username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
    </cfquery>
    
    <cfif updateUser.recordCount>
        <!--- Пользователь найден, предоставить редактирование --->
        <cfoutput query="updateUser">
            <form action="updateUser.cfm" method="post">
                <input type="hidden" name="id" value="#updateUser.id#">
                <input type="text" name="username" value="#updateUser.username#">
                <input type="text" name="first_name" value="#updateUser.first_name#">
                <input type="text" name="last_name" value="#updateUser.last_name#">
                <input type="password" name="password" value="#updateUser.password#">
                <input type="submit" value="Сохранить">
            </form>
        </cfoutput>
    <cfelse>
        <!--- Пользователь не найден --->
        <p>Такого пользователя нет</p>
    </cfif>
</cfif>