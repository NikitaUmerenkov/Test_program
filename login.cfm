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


<cfif structKeyExists(form, "submit")>
    <cfset username = form.username>
    <cfset password = form.password>

    <!--- Проверка наличия пользователя в базе данных --->
    <cfquery name="getUser" datasource="your_database">
        SELECT *
        FROM users
        WHERE username = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfquery name="getPassword" datasource="your_database">
        SELECT *
        FROM users
        WHERE password = <cfqueryparam value="#password#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfif getUser.recordCount EQ 0>
        <p>Такого пользователя не существует.</p>
    <cfelse>
        <cfif getPassword.recordCount EQ 0>
            <p>Неверный пароль.</p>
        <cfelse>
            <cflocation url="menu.cfm">
        </cfif>
    </cfif>
</cfif>

<!--- Форма входа в аккаунт --->
<form method="post" action="">
    <label for="username">Имя пользователя:</label>
    <input type="text" name="username" id="username" required><br>

    <label for="password">Пароль:</label>
    <input type="password" name="password" id="password" required><br>

    <input type="submit" name="submit" value="Войти">
</form>