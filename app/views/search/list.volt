{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("search/list", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ link_to("search/create", "新增搜索") }}
        </li>
    </ul>

    {% for search in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
            <tr>
                <th>序号</th>
                <th>关键词</th>
                <th>图片数</th>
                <th>操作</th>
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ search.id }}</td>
                <td>{{ search.keyword }}</td>
                <td>{{ search.image_count }}</td>
                <td width="7%">{{ link_to("search/delete/?id=" ~ search.id, '<i class="glyphicon glyphicon-remove"></i> 删除', "class": "btn btn-default") }}</td>
            </tr>
        </tbody>
    {% if loop.last %}
        <tbody>
            <tr>
                <td colspan="7" align="right">
                    <div class="btn-group">
                        {{ link_to("search/list/", '<i class="icon-fast-backward"></i> 首页', "class": "btn btn-default") }}
                        {{ link_to("search/list/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上页', "class": "btn btn-default") }}
                        {{ link_to("search/list/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下页', "class": "btn btn-default") }}
                        {{ link_to("search/list/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 末页', "class": "btn btn-default") }}
                        <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                    </div>
                </td>
            </tr>
        <tbody>
    </table>
    {% endif %}
    {% else %}
        No search are recorded
    {% endfor %}

</div>