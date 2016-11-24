{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("pic/list", "&larr; 返回") }}
        </li>
    </ul>

    {% for pic in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
        <tr>
            <th>序号</th>
            <th>APP名称</th>
            <th>图片URL</th>
            <th>简介</th>
            <th>创建用户</th>
            <th>创建时间</th>
            <th>显示状态</th>
            <th>操作</th>
        </tr>
        </thead>
        {% endif %}
        <tbody>
        <tr>
            <td>{{ pic.id }}</td>
            <td>{{ pic.pic_app }}</td>
            <td> <a href="{{ pic.pic_url }}" target="_blank">点击查看</a></td>
            <td>{{ pic.pic_desc}}</td>
            <td>{{ pic.user_id }}</td>
            <td>{{ date("Y-m-d H:i:s",pic.create_time) }}</td>
            <td>{{ pic.get_pic_flag()}}</td>
            <td width="7%">{{ link_to("pic/delete/?id=" ~ pic.id, ''~ '录入系统', "class": "btn btn-default") }}{{ link_to("pic/delete/?id=" ~ pic.id, ''~ '退回用户', "class": "btn btn-default") }}</td>
        </tr>
        </tbody>

        {% if loop.last %}
        <tbody>
        <tr>
            <td colspan="10" align="right">
                <div class="btn-group">
                    {{ link_to("pic/list/", '<i class="icon-fast-backward"></i> 首页', "class": "btn btn-default") }}
                    {{ link_to("pic/list/?page=" ~ page.before, '<i class="icon-step-backward"></i> 上页', "class": "btn btn-default") }}
                    {{ link_to("pic/list/?page=" ~ page.next, '<i class="icon-step-forward"></i> 下页', "class": "btn btn-default") }}
                    {{ link_to("pic/list/?page=" ~ page.last, '<i class="icon-fast-forward"></i> 末页', "class": "btn btn-default") }}
                    <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    {% endif %}
    {% else %}
    No pic are recorded
    {% endfor %}

</div>