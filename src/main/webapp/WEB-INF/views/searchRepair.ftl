<#import "/spring.ftl" as spring/>
<html>
<head>
<#include "master.ftl"/>
    <meta charset="UTF-8">
    <title>Search Repair Page</title>
</head>

<body>
<@navigationbar.navigationbar tab="admin" />

<form name="searchRepairForm" action="searchRepair" method="post">

            <#--<label>Search by SSN:</label>-->
                <div class="col-md-2" ></div>
                <div class="col-md-8" >
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="SSN" name="Ssn" id="ssn">
                        <div class="input-group-btn">
                           <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2" ></div>


                <div class="input-group">
                    <div class="col-md-6" >
                        <input type="datetime-local" class="form-control" placeholder="Datetime" name="datetime" >
                    </div>
                    <div class="col-md-6">
                        <input type="datetime-local" class="form-control" placeholder="Datetime" name="datetime">
                    </div>
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                     </div>
                </div>
</form>

<#if repairList??>
<h3 align="center">Retrieved Repairs (Search via Ssn)</h3>

<div class="table-responsive">
    <table class="table table-striped">

        <#list repairList as repair>
            <form id="searchRepairResults" name="retrieveRepairData" action="updateRepair" method="post">

                <thead>
                <tr>
                    <th class="col-sm-1">Id</th>
                    <th class="col-sm-1">Cost</th>
                    <th class="col-sm-2">Datetime</th>
                    <th class="col-sm-4">Status</th>
                    <th class="col-sm-1">Type</th>
                    <th class="col-sm-1">Description</th>
                    <th class="col-sm-1">Owner</th>
                    <th class="col-sm-1"></th>
                    <th class="col-sm-1"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="col-sm-1"><input class="form-control" type="text" name="serviceid"
                                                value="${repair.serviceid}"/></td>
                    <td class="col-sm-1"><input class="form-control" type="text" name="cost"
                                                value="${repair.cost}"/></td>
                    <td class="col-sm-2"><input class="form-control" type="datetime-local" name="datetime"
                                                value="${repair.datetime}"/></td>
                    <td class="col-sm-1">
                        <select class="form-control" name="status">
                            <option value="Pending"
                                <#if ("${repair.status}" == "Pending") > selected="selected"</#if>
                            >Pending</option>
                            <option value="In Progress"
                                <#if ("${repair.status}" == "In Progress") > selected="selected"</#if>
                            >In Progress</option>
                            <option value="Completed"
                                <#if ("${repair.status}" == "Completed") > selected="selected"</#if>
                            >Completed</option>
                        </select>
                    </td>
                    <td class="col-sm-1">
                        <select class="form-control" name="type" value="${repair.type}">
                            <option value="Minor Service"
                                <#if ("${repair.type}" == "Minor Service") > selected="selected"</#if>
                            >Minor Service</option>
                            <option value="Major Service"
                                <#if ("${repair.type}" == "Major Service") > selected="selected"</#if>
                            >Major Service</option>
                        </select>
                    </td>
                    <td class="col-sm-4"><textarea class="form-control" type="text" rows="3" style="resize:none;" name="freetext"/>${repair.freetext}</textarea>
                    </td>
                    <td class="col-sm-1"><input class="form-control" type="text" name="userid"
                                                value="${repair.user.userid}"/>
                    </td>
                    <td class="col-sm-1">
                        <input class="btn btn-md" id="update" type="submit" href="admin/repair/searchRepair" value="Update">
                    </td>
                    <td>
                        <input class="btn btn-danger btn-md" id="delete" type="submit" value="Delete">
                    </td>
                </tr>
                </tbody>
            </form>
        </#list>
    </table>
</div>

</#if>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $('#delete').click(function() {
        $('#searchRepairResults').attr('action', 'deleteRepair');
    });

</script>
</html>