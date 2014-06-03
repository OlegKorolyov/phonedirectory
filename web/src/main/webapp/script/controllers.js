(function(){
  'use strict';

  var module = angular.module('pd.controllers', ['ngResource', 'bootstrap', 'ui.bootstrap', 'pd.services']);

  module.controller('RecordListController', function($scope, $location, recordService) {
    $scope.filter = {search: ''};

    recordService.query(function(records) {
      $scope.records = records;
      });

    $scope.addRecord = function() {
      $location.path('/record/view');
    };

    $scope.view = function(id) {
      $location.path('/record/view/{id}'.replace('{id}', id));
    };

    $scope.deleteRecord = function(index) {
      recordService.delete($scope.records[index], function(result) {
        $scope.records.splice(index, 1);
      })
    };

    $scope.$watch('filter.search', function(n, o) {
      if (n !== o) {
        recordService.query({search: n}, function(records) {
            $scope.records = records;
        });
      }
    });
  });

  module.controller('RecordViewController', function($scope, $location, $routeParams, recordService) {
    var id = $routeParams.id;

    function init(title, form) {
      $scope.title = title;
      $scope.record = form;
    }

    if (id) {
      recordService.get({id: id}, function (record) {
        init(record.name, record);
      });
    } else {
      init('New', {})
    }

    $scope.save = function() {
      recordService.save($scope.record, function(record) {
        $location.path('/record/view/{id}'.replace('{id}', record.id));
      });
    };

    $scope.delete = function() {
      if (angular.isUndefined($scope.record.id)) return;
      recordService.delete($scope.record, function() {
        $location.path('/record/list');
      })
    };

    $scope.recordsList = function() {
      $location.path('/record/list');
    }
  });

})();