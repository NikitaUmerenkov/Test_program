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

<form action="saveUser.cfm" method="post">
    <label for="username">Учетная запись:</label>
    <input type="text" name="username" id="username" required><br>
    <label for="first_name">Имя:</label>
    <input type="text" name="first_name" id="first_name" required><br>
    <label for="last_name">Фамилия:</label>
    <input type="text" name="last_name" id="last_name" required><br>
    <label for="password">Пароль:</label>
    <input type="password" name="password" id="password" required><br>
    <input type="submit" value="Сохранить">
</form>


<h2><a href="menu.cfm?action=new_error">Меню</a></h2>