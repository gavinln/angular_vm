'use strict';

/**
 * @ngdoc function
 * @name js2App.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the js2App
 */
angular.module('js2App')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
