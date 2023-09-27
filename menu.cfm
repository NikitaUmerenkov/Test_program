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


<ul>
    <li><a href="newError.cfm?action=new_error">Ввод новой ошибки</a></li>
    <li><a href="errorList.cfm?action=error_list">Список ошибок</a></li>
    <li><a href="newUser.cfm?action=new_user">Создание нового пользователя</a></li>
    <li><a href="userList.cfm?action=user_list">Список пользователей</a></li>
    <li><a href="editingUser.cfm?action=editingUser">Редактирование пользователя</a></li>
    <li><a href="editingError.cfm?action=editingError">Редактирование ошибки</a></li>
    <li><a href="index.cfm?action=logout">Выход</a></li>
</ul>

