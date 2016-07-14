{{ elements.getTabs() }}

<div align="center">
    {{ content() }}
{{ form("content/add") }}
    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("content/view", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保存", "class": "btn btn-success") }}
        </li>
    </ul>

    <div class="page-header">
        <h2> 内容添加 </h2>
    </div>
    <div class="page-header">
        <input class="form-control" style="float:left;" value="" name = "img_url" />
    </div>
    <div class="page-header">
        <h4> 粘贴图片URL，URL 格式需要是可调用的URL比如：http://img.meiui.me/app/AirVisual/空气质量，列表，卡片式.PNG </h4>
    </div>
</form>
</div>