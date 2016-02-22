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

    {% for classification in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
            <tr>
                <th>序号</th>
                <th>分类名</th>
                <th>分类下图片数</th>
                <th>分类关联用户数</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ classification.id }}</td>
                <td>{{ classification.tag_name }}</td>
                <td>{{ classification.create_user }}</td>
                <td>{{ classification.tag_type }}</td>
                <td>{{ classification.getFlagDetail()['0'] }}</td>
                <td width="7%">{{ link_to("classification/delete/?id=" ~ classification.id, '<i class="glyphicon glyphicon-remove"></i> '~ classification.getFlagDetail()['1'], "class": "btn btn-default") }}</td>
            </tr>
        </tbody>
    {% if loop.last %}
        <tbody>
            <tr>
                <td colspan="7" align="right">
                    <div class="btn-group">
                        {{ link_to("tag/list/", '<i class="icon-fast-backward"></i> First', "class": "btn btn-default") }}
                        {{ link_to("tag/list/?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn btn-default") }}
                        {{ link_to("tag/list/?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn btn-default") }}
                        {{ link_to("tag/list/?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn btn-default") }}
                        <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                    </div>
                </td>
            </tr>
        <tbody>
    </table>
    {% endif %}
    {% else %}
        No classification are recorded
    {% endfor %}

</div>