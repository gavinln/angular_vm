'use strict';

describe('Controller: MainCtrl', function () {

  // load the controller's module
  beforeEach(module('angularVmApp'));

  var MainCtrl, scope, seasonsFactory;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    var $injector = angular.injector(['angularVmApp']);
    seasonsFactory = $injector.get('seasons');
    MainCtrl = $controller('MainCtrl', {
      $scope: scope,
      seasons: seasonsFactory
    });
  }));

  it('should attach a list of 4 seasons to the scope', function () {
    var seasonsLength = 0;
    for (var key in scope.seasons) {
      if (scope.seasons.hasOwnProperty(key)) {
        seasonsLength++;
      }
    }
    expect(seasonsLength).toEqual(4);
  });
});
