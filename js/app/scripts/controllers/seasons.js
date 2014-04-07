'use strict';

var angularVmApp = angular.module('angularVmApp');

angularVmApp.controller('SpringCtrl', ['$scope', '$http', 'seasons',
                       function ($scope, $http, seasons) {
  $scope.season = seasons.state.spring;
  $scope.seasons = seasons;
  $http.get('http://www.omdbapi.com/?s=spring').success(
    function(data) {
      $scope.movies = data.Search;
    }
  );
}]);

angularVmApp.controller('SummerCtrl', ['$scope', '$http', 'seasons',
                       function ($scope, $http, seasons) {
  $scope.season = seasons.state.summer;
  $scope.seasons = seasons;
  $http.get('http://www.omdbapi.com/?s=summer').success(
    function(data) {
      $scope.movies = data.Search;
    }
  );
}]);

angularVmApp.controller('AutumnCtrl', ['$scope', '$http', 'seasons',
                       function ($scope, $http, seasons) {
  $scope.season = seasons.state.autumn;
  $scope.seasons = seasons;
  $http.get('http://www.omdbapi.com/?s=autumn').success(
    function(data) {
      $scope.movies = data.Search;
    }
  );
}]);

angularVmApp.controller('WinterCtrl', ['$scope', '$http', 'seasons',
                       function ($scope, $http, seasons) {
  $scope.season = seasons.state.winter;
  $scope.seasons = seasons;
  $http.get('http://www.omdbapi.com/?s=winter').success(
    function(data) {
      $scope.movies = data.Search;
    }
  );
}]);
