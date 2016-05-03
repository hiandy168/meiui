<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"> -->
	<title>美 UI</title>
	<meta name="description" content="美UI，一个分享UI的应用，帮助你更好的微创新。">
    <meta name="keywords" content="产品经理,交互设计,UI设计,iOS,截图,UI分享,分享,UI设计,产品设计">

	<style>
		body,div,p{
			margin:0;
			padding: 0;
		}
		html,body{
			width: 100%;height: 100%;
			overflow: hidden;
		}
		body{
			position: relative;
			font-family: Microsoft YaHei,tahoma,Hel;
			background: url("/img/bg.png") no-repeat;
			background-size: cover;
		}
		.wrap{
			position: absolute;
			width:960px;height: 800px;
			left:50%;top:50%;
			margin-left: -480px;margin-top: -300px;
		}
		.header{
			margin-top:60px;
			text-align: center;
		}
		.logo{
			margin-left:-50px;
		}
		.title{
			position: relative;
			
			margin-left:30px;
		}
		.declaration{
			margin-top:10px;
			font-size: 20px;
			color:#F1F1F1;
			text-align: center;
		}
		.qrcode{
			margin-top:13px;
		}
		.qrcodeImg,.qrcodeTip{
			text-align: center;
		}
		.qrcodeImg{
			height: 200px;line-height: 200px;
			text-align: center;
			color:#fff;
			margin-top:50px;
			font-size: 46px;
		}
		.qrcodeTip{
			margin-top:24px;
		}
		.footer{
			margin-top:100px;
			margin-bottom:10px;
			font-size: 12px;
			color:#F5F5F5;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<img class="logo" src="/img/icon.png" alt="" width="80" height="80">
			<span class="title"><img src="http://www.meiui.me/img/title.png" width="123" height="60" alt=""></span>
		</div>
		<p class="declaration">看似遥不可及的设计，只不过是一个APP的距离</p>
		<div class="qrcode">
			<div class="qrcodeImg">
				<img src="/img/MeiUI_QR.png" width="200" height="200" alt="">
				<!-- comming soon ...-->
			</div>
			<div class="qrcodeTip">
				<img src="/img/qrcodeTip.png" width="160"  alt="">
			</div>
			<div class="footer">
				麻乌科技 Copyright© 2016        沪ICP备16009432号-1        联系方式：185-2159-8476
			</div>
		</div>
	</div>
</body>
</html>