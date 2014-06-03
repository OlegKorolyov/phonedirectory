<#import "/spring.ftl" as s />
<#import "utils.ftl" as u />

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
  <!--[if lt IE 9]>
    <script type="text/javascript" src="<@u.url "/lib/html5shiv/html5shiv.js"/>"></script>
    <script type="text/javascript" src="<@u.url "/lib/respond/respond.src.js"/>"></script>
  <![endif]-->
  <title>Phone Directory</title>

  <!-- CSS Styles -->
  <link rel="stylesheet" href="<@u.url "/lib/bootstrap/css/bootstrap${debug?string('', '.min')}.css"/>">
  <link rel="stylesheet" href="<@u.url '/style/style.css'/>">

  <!-- JS Declarations -->
  <script type="text/javascript" src="<@u.url "/lib/jquery/jquery-1.9.1${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular/angular${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular/angular-bootstrap${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular/angular-resource${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular/angular-route${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular/angular-sanitize${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular-ui/bootstrap/ui-bootstrap-0.6.0${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/angular-ui/bootstrap/ui-bootstrap-tpls-0.6.0${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/lib/bootstrap/js/bootstrap${debug?string('', '.min')}.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/script/app.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/script/controllers.js"/>"></script>
  <script type="text/javascript" src="<@u.url "/script/services.js"/>"></script>

</head>
<body>
  <div class="container" ng-app="pd">
    <div class="row">
      <div class="header">
        Phone directory - test
      </div>
    </div>
    <div class="row">
      <div class="content" style="min-height: 550px;">
        <div ng-view=""></div>
      </div>
    </div>
    <div class="row">
      <div class="footer">
        Developed by Korolyov O. (alekking@gmail.com)
      </div>
    </div>
  </div>
</body>
</html>