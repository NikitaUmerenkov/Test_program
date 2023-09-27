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




<form action="saveError.cfm" method="post">
    <label for="number">Номер:</label>
    <input type="integer" name="number" id="number" required><br>
    <label for="date">Дата:</label>
    <input type="date" name="date" id="date" required><br>
    <label for="short_description">Короткое описание:</label>
    <input type="text" name="short_description" id="short_description" required><br>
    <label for="detailed_description">Подробное описание:</label>
    <textarea name="detailed_description" id="detailed_description" required></textarea><br>
    <label for="user">Пользователь:</label>
    <input type="text" name="user" id="user" required><br>
    <label for="status">Статус:</label>
    <select name="status" id="status">
        <option value="Новая">Новая</option>
        <option value="Открытая">Открытая</option>
        <option value="Решенная">Решенная</option>
        <option value="Закрытая">Закрытая</option>
    </select><br>
    <label for="urgency">Срочность:</label>
    <select name="urgency" id="urgency">
        <option value="Очень срочно">Очень срочно</option>
        <option value="Срочно">Срочно</option>
        <option value="Не срочно">Не срочно</option>
        <option value="Совсем не срочно">Совсем не срочно</option>
    </select><br>
    <label for="severity">Критичность:</label>
    <select name="severity" id="severity">
        <option value="Авария">Авария</option>
        <option value="Критичная">Критичная</option>
        <option value="Некритичная">Некритичная</option>
        <option value="Запрос на изменение">Запрос на изменение</option>
    </select><br>
    <input type="submit" value="Сохранить">
</form>


<h2><a href="menu.cfm?action=new_error">Меню</a></h2>