<#import "/spring.ftl" as spring/>
<html>
<head>
    <#include "master.ftl"/>
    <title>Welcome!</title>
    <meta charset="UTF-8">
    <title>Admin Page</title>
</head>
<body>
<@navigationbar.navigationbar tab="admin"/>
<h2>${message!""}</h2>
<h2>${errorMessage!""}</h2>


<#if username??>
<h1> Welcome, ${username}</h1>

<#if repairList??>
<h3>Retrieved Repairs:</h3>
<table>
    <#list repairList as repair>
        <tr>
            <td> Cost:${repair.cost}</td>
            <td> Datetime: ${repair.datetime}</td>
            <td> Status: ${repair.status}</td>
            <td> Type: ${repair.type}</td>
        </tr>
    </#list>
</table>
<#else>
<h2> No repairs found </h2>
</#if>
</br>
<form name="searchForm" action="/search" method="post">
    <label>Search by Email:</label><input type="text" name="email" placeholder="Email"/></br>
    <label>Search by SSN:</label><input type="text" name="ssn" placeholder="SSN"/></br>
    <label>Search by Email Or SSN:</label><input type="text" name="emailsorssn" placeholder="Email or SSN"/></br>

    <input type="submit" value="Search">
</form>


<form name="searchRepairForm" action="/search2" method="post">
<label>Search by SSN:</label><input type="text" name="ssn" placeholder="SSN"/></br>
<input type="submit" value="Search">
</form>

<#if emailsorssns??>
<h3>Retrieved Users (Search via Email Or Ssn)</h3>

<#list emailsorssns as emailsorssn>
    <form id="searchResults" name"retrieveUserData" action="/update" method="post">
        <label>User Id:</label><input type="text" name="userid" value = "${emailsorssn.userid}" /></br>
        <label>User Ssn:</label><input type="text" name="ssn" value = "${emailsorssn.ssn}" /></br>
        <label>User Password:</label><input type="text" name="password" value = "${emailsorssn.password}" /></br>
        <label>User First Name:</label><input type="text" name="firstname" value = "${emailsorssn.firstname}" /></br>
        <label>User Last Name:</label><input type="text" name="lastname" value = "${emailsorssn.lastname}" /></br>
        <label>User Email:</label><input type="text" name="email" value = "${emailsorssn.email}" /></br>
        <label>User Address:</label><input type="text" name="address" value = "${emailsorssn.address}" /></br>
        <label>User Type:</label><input type="text" name="typeofuser" value = "${emailsorssn.typeofuser}" />

        <input id="update" type="submit" value="Update">
        <input id="delete" type="submit" value="Delete">
    </form>

</#list>
</#if>

<h2><a href="/logout">Logout</a></h2>

<#else>

<h1><a href="/login">Log In</a></h1>
</#if>

</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $('#delete').click(function(){
        $('#searchResults').attr('action', '/delete');
        });
    </script>
</html>