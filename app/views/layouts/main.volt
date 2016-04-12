<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('css/bootstrap.min.css') }}
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="MEIUI">
        <meta name="author" content="MEIUI Team">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">meiui</a>
                </div>
                {{ elements.getMenu() }}
            </div>
        </nav>
        <div class="container">
            {{ flash.output() }}
            {{ content() }}
            <hr>
            <footer>
                <p style='text-align: center;'>麻乌科技 Copyright &copy; 2016 沪ICP备16009432号-1 联系方式：185-2159-8476</p>
            </footer>
        </div>
        {{ javascript_include('js/jquery.min.js') }}
        {{ javascript_include('js/bootstrap.min.js') }}
        {{ javascript_include('js/utils.js') }}
    </body>
</html>