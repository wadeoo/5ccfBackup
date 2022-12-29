<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>添加学生界面</h1>
<form action="AddStudent" method="post">
<table>
<tr><td>姓名：</td><td><input type="text" name="name" required/></td></tr>
<tr><td>邮箱：</td><td><input type="email" name="email" required/></td></tr>
<tr><td>性别:</td><td>
<input type="radio" name="sex" value="m"/> 男
<input type="radio" name="sex" value="f"/> 女
</td></tr>
<tr><td>科目：</td><td>
<select name="course">
<option>Java</option>
<option>.Net</option>
<option>PHP</option>
<option>Android</option>
</select>
</td></tr>
<tr><td>应缴费用：</td><td><input type="number" name="fee"/></td></tr>
<tr><td>已缴金额：</td><td><input type="number" name="paid"/></td></tr>
<tr><td>额外罚款：</td><td><input type="number" name="due"/></td></tr>
<tr><td>地址：</td><td><textarea name="address" style="width:300px;height:100px;"></textarea></td></tr>
<tr><td>联系方式：</td><td><input type="text" name="contact"/></td></tr>
<tr><td colspan="2" align="center"><input type="submit" class="btn btn-default" value="保存学生"/></td></tr>
</table>
</form>
