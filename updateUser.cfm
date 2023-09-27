<cfif structKeyExists(form, "id")>
    <cfquery name="updateUser" datasource="your_database">
        UPDATE users
        SET username = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">,
            first_name = <cfqueryparam value="#form.first_name#" cfsqltype="cf_sql_varchar">,
            last_name = <cfqueryparam value="#form.last_name#" cfsqltype="cf_sql_varchar">,
            password = <cfqueryparam value="#form.password#" cfsqltype="cf_sql_varchar">
        WHERE id = <cfqueryparam value="#form.id#" cfsqltype="cf_sql_integer">
    </cfquery>
    
    <p>Данные пользователя успешно сохранены</p>
</cfif>
<h2><a href="menu.cfm?action=new_error">Меню</a></h2>