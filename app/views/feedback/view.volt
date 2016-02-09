{{ elements.getTabs() }}

<div align="center">
    {{ content() }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("feedback/list", "&larr; 返回") }}
        </li>
    </ul>

    <div class="page-header">
        <h2>问题和意见</h2>
    </div>

    <p>{{ feedback.msg }}</p>

    <div class="page-header">
        <h2>图片</h2>
    </div>

    <p>
    {% for pic in feedback.pic_arr %}
        {% if pic %}
            <img src="{{ pic }}"  />
        {% endif %}
    {% endfor%}
         </p>
</div>