<%@page pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>

<t:layout>
    <div class="card-panel">
        <a href="add" class="waves-effect waves-light btn green"><i class="material-icons left">add</i>添加新随笔</a>
        <table class="striped">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>日期</th>
                    <th>可见性</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <t:diary_list_admin />
            </tbody>
        </table>
    </div>
</t:layout>
