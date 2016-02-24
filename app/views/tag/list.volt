{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("tag/list", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ link_to("tag/create", "新增分类") }}
        </li>
    </ul>

    {% for one_tag in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
            <tr>
                <th>序号</th>
                <th>标签名</th>
                <th>创建用户名</th>
                <th>创建时间</th>
                <th>标签类型</th>
                <th>显示状态</th>
                <th>操作</th>
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ one_tag.id }}</td>
                <td>{{ one_tag.tag_name }}</td>
                <td>{{ one_tag.create_user }}</td>
                <td>{{ date("Y-m-d H:i:s",one_tag.create_time) }}</td>
                <td>{{ one_tag.getTypeDetail() }}</td>
                <td>{{ one_tag.getFlagDetail()['0'] }}</td>
                <td width="7%">{{ link_to("tag/delete/?id=" ~ one_tag.id, '<i class="glyphicon glyphicon-remove"></i> '~ one_tag.getFlagDetail()['1'], "class": "btn btn-default") }}</td>
            </tr>
        </tbody>
    {% if loop.last %}
        <tbody>
            <tr>
                <td colspan="7" align="right">
                    <div class="btn-group">
                        {{ link_to("tag/list/", '<i class="icon-fast-backward"></i> 首页', "class": "btn btn-default") }}
                        {{ link_to("tag/list/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上页', "class": "btn btn-default") }}
                        {{ link_to("tag/list/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下页', "class": "btn btn-default") }}
                        {{ link_to("tag/list/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 末页', "class": "btn btn-default") }}
                        <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                    </div>
                </td>
            </tr>
        <tbody>
    </table>
    {% endif %}
    {% else %}
        No tag are recorded
    {% endfor %}

</div>