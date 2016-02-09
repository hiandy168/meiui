
{{ content() }}

<div class="page-header">
    <h2>联系我们</h2>
</div>

<p>发给我们你的建议，以及用时碰到的问题. 你更清晰的描述，更有助于我们改进，我们会做的更好.</p>

{{ form('feedback/send', 'role': 'form') }}
    <fieldset>
        <div class="form-group">
            {{ form.label('phone') }}
            {{ form.render('phone', ['class': 'form-control']) }}
        </div>
        <div class="form-group">
            {{ form.label('email') }}
            {{ form.render('email', ['class': 'form-control']) }}
        </div>
        <div class="form-group">
            {{ form.label('msg') }}
            {{ form.render('msg', ['class': 'form-control']) }}
        </div>
        <div class="form-group">
            {{ submit_button('Send', 'class': 'btn btn-primary btn-large') }}
        </div>
    </fieldset>
</form>
