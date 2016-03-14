{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("app/list", "&larr; 返回") }}
        </li>
    </ul>

    {% for app in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
            <tr>
                <th>序号</th>
                <th>APP名称</th>
                <th>所属系统</th>
                <th>描述</th>
                <th>创建用户</th>
                <th>创建时间</th>
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ app.id }}</td>
                <td>{{ app.app_name }}</td>
                <td>{{ app.getAppSysDetail() }}</td>
                <td>{{ app.description }}</td>
                <td>{{ app.create_user }}</td>
                <td>{{ date("Y-m-d H:i:s",app.create_time) }}</td>
            </tr>
        </tbody>
    {% if loop.last %}
        <tbody>
            <tr>
                <td colspan="7" align="right">
                    <div class="btn-group">
                        {{ link_to("app/list/", '<i class="icon-fast-backward"></i> 首页', "class": "btn btn-default") }}
                        {{ link_to("app/list/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上页', "class": "btn btn-default") }}
                        {{ link_to("app/list/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下页', "class": "btn btn-default") }}
                        {{ link_to("app/list/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 末页', "class": "btn btn-default") }}
                        <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                    </div>
                </td>
            </tr>
        <tbody>
    </table>
    {% endif %}
    {% else %}
        No companies are recorded
    {% endfor %}

</div>