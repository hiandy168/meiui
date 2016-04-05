{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("feed/list", "&larr; 返回") }}
        </li>
    </ul>

    {% for feedback in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
            <tr>
                <th>反馈账号</th>
                <th>问题和意见</th>
                <th>处理状态</th>
                <th>操作</th>
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ feedback.getUsernameDetail() }}</td>
                <td>{{ feedback.msg }}</td>
                <td>{{ feedback.getFlagDetail() }}</td>
                <td width="7%">{{ link_to("feedback/view/?id=" ~ feedback.id, '查看', "class": "btn btn-default") }}</td>
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
        No companies are recorded
    {% endfor %}

</div>