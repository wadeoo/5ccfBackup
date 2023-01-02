<%@page import="com.yusufsezer.model.Diary"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="t" %>

<t:layout>
    <!-- Content -->
    <div class="card-panel">
        <div class="row">
            <t:message />
            <form class="col s12" method="POST">

                <!-- Content -->
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="diaryContent" name="diaryContent" class="materialize-textarea grey-text" style="font-size: 2em; font-style: italic;">${diary.getContent()}</textarea>
                    </div>
                </div>

                <!-- Switch -->
                <div class="switch">
                    <label>
                        隐藏
                        <input name="visible" type="checkbox" ${diary.isVisibility() ? "checked" : ""} />
                        <span class="lever"></span> 可见
                    </label>
                </div>

                <br />

                <button class="btn waves-effect waves-light grey" type="submit" name="action">提交
                    <i class="material-icons right">send</i>
                </button>

            </form>
        </div>

    </div>
</t:layout>
