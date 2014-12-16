'use strict';

/**
 * @ngdoc function
 * @name js2App.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the js2App
 */
angular.module('js2App')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
