(function () {
  'use strict';

  var app = angular.module('pd', ['ngResource', 'ngRoute', 'pd.controllers', 'pd.services']);

  app.config(function ($routeProvider) {
      $routeProvider
        .when('/record/list', {templateUrl: 'view/record/list.html', controller: 'RecordListController'})
        .when('/record/view/:id?', {templateUrl: 'view/record/view.html', controller: 'RecordViewController'})
        .otherwise({templateUrl: 'view/record/list.html', controller: 'RecordListController'});
    });
})();
