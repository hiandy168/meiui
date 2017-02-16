{{ elements.getTabs() }}

<div align="center">
    {{ content() }}
    {{ form("pic/edit_user_pic") }}
    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("pic/list", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保存", "class": "btn btn-success") }}
        </li>
    </ul>

    <div class="page-header">
        <h2> 内容添加 </h2>
    </div>
    <div class="page-header">
        APP名称<input class="form-control" style="float:left;" value="{{ pic_cache.pic_app}}" name = "pic_app" />
        标签<input class="form-control" style="float:left;" value="{{ pic_cache.pic_tag}}" name = "pic_tag" />
        简介<input class="form-control" style="float:left;" value="{{ pic_cache.pic_desc}}" name = "pic_desc" />
    </div>
    </form>
</div>