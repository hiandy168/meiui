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
                <th>图片内容</th>
                <th>所属APP</th>
                <th>关联标签</th>
                <th>关联用户</th>
                <th>所属系统</th>
                <th>操作</th>
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ app.id }}</td>
                <td>{{ app.using_pic }}</td>
                <td>{{ app.app_name }}</td>
                <td>{{ app.app_classification }}</td>
                <td>{{ app.using_flag }}</td>
                <td>{{ app.app_sys }}</td>
                <td width="7%">{{ link_to("companies/flag/?flag=" ~ app.using_flag, ''~app.getFlagDetail(), "class": "btn btn-default") }}</td>
            </tr>
        </tbody>
    {% if loop.last %}
        <tbody>
            <tr>
                <td colspan="7" align="right">
                    <div class="btn-group">
                        {{ link_to("companies/search", '<i class="icon-fast-backward"></i> First', "class": "btn btn-default") }}
                        {{ link_to("companies/search?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn btn-default") }}
                        {{ link_to("companies/search?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn btn-default") }}
                        {{ link_to("companies/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn btn-default") }}
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