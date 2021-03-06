{{ elements.getTabs() }}

<div align="center">
    {{ content() }}
    {{ form("pic/edit_user_pic") }}
    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("pic/user_list", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保存", "class": "btn btn-success") }}
        </li>
    </ul>

    <div class="page-header">
        <h2> 用户上传内容修改 </h2>
    </div>
    <div class="page-header">
        APP名称<input class="form-control" style="float:left;" value="{{ pic_cache.pic_app}}" name = "pic_app" />
    </div>
    <div class="page-header">
    标签<input class="form-control" style="float:left;" value="{{ pic_cache.pic_tag}}" name = "pic_tag" />
    </div>
    <div class="page-header">
    简介<input class="form-control" style="float:left;" value="{{ pic_cache.pic_desc}}" name = "pic_desc" />
    </div>
    <div class="page-header">
        审核状态
        <input type="radio" name="pic_flag"  value="1" <?php echo $pic_cache->getFlagCheck(1)?>/>
        未审核
        <input type="radio" name="pic_flag"  value="2" <?php echo $pic_cache->getFlagCheck(2)?>/>
        审核通过
        <input type="radio" name="pic_flag"  value="3" <?php echo $pic_cache->getFlagCheck(3)?>/>
        审核拒绝
    </div>
    <div class="page-header">
        如审核未通过,请填写原因
        <input class="form-control" style="float:left;" value="{{ pic_cache.back_msg}}" name = "back_msg" />
    </div>
    <input type="hidden" value="{{ pic_cache.id}}" name = "id" />
    </form>
</div>