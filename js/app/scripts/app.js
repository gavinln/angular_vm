'use strict';

angular.module('angularVmApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
])
.config(function ($routeProvider) {
    $routeProvider
    .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
    })
    .when('/spring', {
        templateUrl: 'views/spring.html',
        controller: 'SpringCtrl'
    })
    .when('/summer', {
        templateUrl: 'views/summer.html',
        controller: 'SummerCtrl'
    })
    .when('/autumn', {
        templateUrl: 'views/autumn.html',
        controller: 'AutumnCtrl'
    })
    .when('/winter', {
        templateUrl: 'views/winter.html',
        controller: 'WinterCtrl'
    })
    .otherwise({
        redirectTo: '/'
    });
});
