{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("pic/list", "&larr; 返回") }}
        </li>
        <li class="previous pull-right">
            {{ link_to("pic/user_list", "&larr; 用户上传列表") }}
        </li>
    </ul>

    {% for pic in page.items %}
    {% if loop.first %}
    <table class="table table-bordered table-striped" align="center">
        <thead>
            <tr>
                <th>序号</th>
                <th>APP名称</th>
                <th>所属系统</th>
                <th>图片URL</th>
                <th>宽*高</th>
                <th>简介</th>
                <th>创建用户</th>
                <th>创建时间</th>
<!--                <th>显示状态</th>-->
<!--                <th>操作</th>-->
            </tr>
        </thead>
    {% endif %}
        <tbody>
            <tr>
                <td>{{ pic.id }}</td>
                <td>{{ pic.app_name }}</td>
                <td>{{ pic.pic_sys }}</td>
                <td> <a href="{{ pic.pic_url }}" target="_blank">点击查看</a></td>
                <td>{{ pic.pic_w }}*{{ pic.pic_w }}</td>
                <td><input id="pic_brief_{{ pic.id }}" name="pic_brief_keyword" class="form-control" value="{{ pic.brief }}"  onblur="myFunction(this,{{ pic.id }});" /></td>
                <td>{{ pic.getMeiuiUser().nickname }}</td>
                <td>{{ date("Y-m-d H:i:s",pic.create_time) }}</td>
<!--                <td>{{ pic.getFlagDetail()['0'] }}</td>-->
<!--                <td width="7%">{{ link_to("pic/delete/?id=" ~ pic.id, '<i class="glyphicon glyphicon-remove"></i> '~ pic.getFlagDetail()['1'], "class": "btn btn-default") }}</td>-->
            </tr>
        </tbody>
        <script>
        function myFunction(item,id)
        {
            var brief = item.value;
            $.ajax({
              type: 'POST',
              url: '/pic/changeBrief',
              data: {'id':id, 'brief':brief},
              success: function(data){
                //alert(data.type);
              },
              dataType: 'json'
            });
        }

        </script>
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