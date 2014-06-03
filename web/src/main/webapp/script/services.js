(function(){
  'use strict';

  var module = angular.module('pd.services', ['ngRoute', 'ngResource', 'ui.bootstrap']);

  module.factory('recordService', function($resource, $http){
    var service = $resource('service/record/:id', {id: '@id'});

    return service;
  });

})();