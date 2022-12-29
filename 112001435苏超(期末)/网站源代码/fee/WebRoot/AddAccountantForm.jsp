<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form action="AddAccountant" method="post">
<table>
<tr><td>姓名:</td><td><input type="text" name="name" required/></td></tr>
<tr><td>密码：</td><td><input type="password" name="password" required/></td></tr>
<tr><td>邮箱：</td><td><input type="email" name="email" required/></td></tr>
<tr><td>地址：</td><td><textarea name="address" style="width:300px; height:100px;"></textarea></td></tr>
<tr><td>联系方式：</td><td><input type="text" name="contact"/></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="添加财务人员"/></td></tr>
</table>
</form>