{{ elements.getTabs() }}
<div align="center">
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("user/list", "&larr; Go Back") }}
    </li>
</ul>
{% for product in page.items %}
    {% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>用户来源</th>
            <th>用户名</th>
            <th>分类数</th>
            <th>收藏总数</th>
            <th>上传数</th>
            <th>操作</th>
        </tr>
    </thead>
    <tbody>
    {% endif %}
        <tr>
            <td>{{ product.getSourceDetail() }}</td>
            <td>{{ product.username }}</td>
            <td>{{ product.getMeiuiUserData().user_classification_count }}</td>
            <td>{{ product.getMeiuiUserData().user_collection_count }}</td>
            <td>{{ product.getMeiuiUserData().user_upload_count }}</td>
            <td width="7%">{{ link_to("products/delete/" ~ product.username, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-default") }}</td>
        </tr>
    {% if loop.last %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("products/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
                    {{ link_to("products/search?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn") }}
                    {{ link_to("products/search?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn") }}
                    {{ link_to("products/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn") }}
                    <span class="help-inline">{{ page.current }} of {{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tbody>
</table>
    {% endif %}
{% else %}
    No products are recorded
{% endfor %}
</div>
