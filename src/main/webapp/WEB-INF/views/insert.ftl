<#import "/spring.ftl" as spring/>
<html>

<head>
  <#include "master.ftl"/>
  <title>Insert Owner Page</title>
  <meta charset="UTF-8">
</head>

<body>

  <body>
    <@navigationbar.navigationbar tab="admin" />
    <form name="insertForm" modelAttribute="insertForm" action="/admin/owner/insert" method="post">
      <label>Ssn:</label><input type="text" name="ssn" placeholder="Ssn" /><br/>
      <label>Email:</label><input type="text" name="email" placeholder="Email" /><br/>
      <label>First name:</label><input type="text" name="firstname" placeholder="First name" /><br/>
      <label>Last name:</label><input type="text" name="lastname" placeholder="Last name" /><br/>
      <label>Address:</label><input type="text" name="address" placeholder="Address" /><br/>
      <label>Password:</label><input type="text" name="password" placeholder="Password" /><br/>
      <label>Type of user:</label><input type="text" name="typeofuser" placeholder="Type of user" /><br/>
      <input type="submit" value="Insert">
    </form>
  </body>

</html>