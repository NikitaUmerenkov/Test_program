<cfparam name="form.errorNumber" default="">
<cfparam name="form.date" default="">
<cfparam name="form.shortDescription" default="">
<cfparam name="form.detailedDescription" default="">
<cfparam name="form.user" default="">
<cfparam name="form.status" default="">
<cfparam name="form.urgency" default="">
<cfparam name="form.severity" default="">

<cfquery name="updateError" datasource="your_database">
    UPDATE errors
    SET date = <cfqueryparam value="#form.date#" cfsqltype="cf_sql_date">,
        short_description = <cfqueryparam value="#form.shortDescription#" cfsqltype="cf_sql_varchar">,
        detailed_description = <cfqueryparam value="#form.detailedDescription#" cfsqltype="cf_sql_longvarchar">,
        user = <cfqueryparam value="#form.user#" cfsqltype="cf_sql_varchar">,
        status = <cfqueryparam value="#form.status#" cfsqltype="cf_sql_varchar">,
        urgency = <cfqueryparam value="#form.urgency#" cfsqltype="cf_sql_varchar">,
        severity = <cfqueryparam value="#form.severity#" cfsqltype="cf_sql_varchar">
    WHERE number = <cfqueryparam value="#form.number#" cfsqltype="cf_sql_integer">
</cfquery>

<p>Данные успешно сохранены.</p>

<h2><a href="menu.cfm?action=new_error">Меню</a></h2>