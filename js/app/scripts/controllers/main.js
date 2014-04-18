(function () {

    'use strict';

    var angularVmApp = angular.module('angularVmApp');

    angularVmApp.factory('seasons', function () {
        var state = {
            'spring': ['April 18, 2014', 'May 26, 2014'],
            'summer': ['July 4, 2014'],
            'autumn': ['September 1, 2014', 'November 27, 2014'],
            'winter': ['December 25, 2014', 'January 1, 2015']
        };
        var selection = ['April 18, 2014', 'November 27, 2014'];

        return {
            state: state,
            isSelected: function (date) {
                return selection.indexOf(date) > -1;
            },
            toggleSelection: function (date) {
                var idx = selection.indexOf(date);
                if (idx > -1) {
                    selection.splice(idx, 1);
                } else {
                    selection.push(date);
                }
            },
            selectedCount: function() {
                return selection.length;
            }
        };
    });

    angularVmApp.controller(
        'MainCtrl', ['$scope', 'seasons',
            function ($scope, seasons) {
                $scope.seasons = seasons.state;
            }]);

}());
