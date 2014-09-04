'use strict';

angular.module('angularVmApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ui.router'
])
.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/home');
    $stateProvider
    .state('home', {
        url: '/home',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
    })
    .state('home.spring', {
        url: '/spring',
        templateUrl: 'views/spring.html',
        controller: 'SpringCtrl'
    })
    .state('home.summer', {
        url: '/summer',
        templateUrl: 'views/summer.html',
        controller: 'SummerCtrl'
    })
    .state('home.autumn', {
        url: '/autumn',
        templateUrl: 'views/autumn.html',
        controller: 'AutumnCtrl'
    })
    .state('home.winter', {
        url: '/winter',
        templateUrl: 'views/winter.html',
        controller: 'WinterCtrl'
    });
});
