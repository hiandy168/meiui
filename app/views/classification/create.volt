{{ elements.getTabs() }}

<div align="center">
{{ content() }}

{{ form("classification/create") }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("products", "&larr; 返回") }}
        </li>
        <li class="pull-right">
            {{ submit_button("保存", "class": "btn btn-success") }}
        </li>
    </ul>

    <fieldset>

    {% for element in form %}
        {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
            {{ element }}
        {% else %}
            <div class="form-group">
                {{ element.label() }}
                {{ element.render(['class': 'form-control']) }}
            </div>
        {% endif %}
    {% endfor %}

    </fieldset>

</form>
</div>

