{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("user/list", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ link_to("content/add", "单个内容添加") }}
        </li>

    </ul>

    <div class="page-header">
        <h2> 首页排序规则 </h2>
    </div>
    <div class="page-header">
        <input class="form-control" style="float:left;" value="{{index_order.rule_value}}"  onblur="myFunction(this);" />
    </div>
    <div class="page-header">
        <h4> 大于0时 按数字的每小时随机排序 | 小于等于 0 按上传时间排序 </h4>
    </div>


    <script>
    function myFunction(item)
    {
        var order_time = item.value;
        $.ajax({
          type: 'POST',
          url: '/content/view',
          data: {'order_time':order_time},
          success: function(data){
            //alert(data.type);
          },
          dataType: 'json'
        });
    }

    </script>
</div>