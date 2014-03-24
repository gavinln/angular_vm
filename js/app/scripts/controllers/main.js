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
        'MainCtrl', ['$scope', '$http', '$location', 'seasons',
            function ($scope, $http, $location, seasons) {
                var dj_url = $location.protocol() + '://' +
                    $location.host() + ':8003/';
                $scope.dj_polls = dj_url + 'polls/';
                $scope.dj_admin = dj_url + 'admin/';
                var url = $scope.dj_polls + "api/?format=json";

                $scope.seasons = seasons.state;
                $scope.openedPoll = null;
                $scope.selectedChoice = { 'option': null };
                $scope.resultOpen = false;

                $scope.openPoll = function(poll) {
                    $scope.resultOpen = false;
                    if ($scope.isOpen(poll)) {
                        $scope.openedPoll = null;
                    }
                    else {
                        $scope.openedPoll = poll;
                    }
                };
                $scope.isOpen = function(poll) {
                    return $scope.openedPoll === poll;
                };
                $scope.anyPollOpen = function() {
                    return $scope.openedPoll !== null;
                };
                $scope.showResult = function() {
                    $scope.resultOpen = !$scope.resultOpen;
                };
                $scope.submit = function() {
                    var choiceVote = {
                        pk:$scope.selectedChoice.option,
                        vote: true
                    };
                    alert(choiceVote);
                };
                $http.get(url).success(
                    function(data) {
                        $scope.polls = data;
                    }
                );
            }]);

}());
