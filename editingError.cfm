<!---Подключение драйвера для работы с БД--->

<cfset driver = "com.mysql.jdbc.Driver">
<cfset connectionString = "jdbc:mysql://localhost:3306/your_database">
<cfset number = "root">
<cfset password = "">

<cftry>
    <cfset driverObj = createObject("java", driver).init()>
    <cfset props = createObject("java", "java.util.Properties").init()>
    <cfset props.setProperty("user", number)>
    <cfset props.setProperty("password", password)>
    <cfset conn = driverObj.connect(connectionString, props)>
    
    <cfcatch>
        <cfoutput>
            Ошибка подключения к базе данных: #cfcatch.message#
        </cfoutput>
    </cfcatch>
</cftry>


<cfform>
<cfinput type="text" name="number" placeholder="Введите номер ошибки">
<cfinput type="submit" value="Проверить" name="submit">
</cfform>

<cfif structKeyExists(form, "number")>
    <cfquery name="updateError" datasource="your_database">
        SELECT * FROM errors WHERE number = <cfqueryparam value="#form.number#" cfsqltype="cf_sql_integer">
    </cfquery>

<cfif updateError.recordCount>
        <!--- ошибка найдена, предоставить редактирование --->
        <cfoutput query="updateError">
            <form action="updateError.cfm" method="post">
        <input type="hidden" name="number" value="#updateError.number#">
        <label for="date">Дата:</label>
        <input type="text" name="date" value="#updateError.date#">
        
        <br>
        
        <label for="shortDescription">Краткое описание:</label>
        <input type="text" name="shortDescription" value="#updateError.short_description#">
        
        <br>
        
        <label for="detailedDescription">Подробное описание:</label>
        <textarea name="detailedDescription">#updateError.detailed_description#</textarea>
        
        <br>
        
        <label for="user">Пользователь:</label>
        <input type="text" name="user" value="#updateError.user#">
        
        <br>
        
        <label for="status">Статус:</label>
        <select name="status" id="status">
        <option value="Новая">Новая</option>
        <option value="Открытая">Открытая</option>
        <option value="Решенная">Решенная</option>
        <option value="Закрытая">Закрытая</option>
        </select>
        
        <br>

        <label for="urgency">Срочность:</label>
        <select name="urgency" id="urgency">
        <option value="Очень срочно">Очень срочно</option>
        <option value="Срочно">Срочно</option>
        <option value="Не срочно">Не срочно</option>
        <option value="Совсем не срочно">Совсем не срочно</option>
        </select>
        
        <br>

        <label for="severity">Серьезность:</label>
        <select name="severity" id="severity">
        <option value="Авария">Авария</option>
        <option value="Критичная">Критичная</option>
        <option value="Некритичная">Некритичная</option>
        <option value="Запрос на изменение">Запрос на изменение</option>
        </select>

        <br>

        <input type="submit" value="Сохранить">
    </form>
</cfoutput>
    <cfelse>
        <!--- ошибка не найдена --->
        <p>Такого пользователя нет</p>
    </cfif>
</cfif>