angular.module('todoList')
.controller('NavCtrl', [
  '$scope',
  '$rootScope',
  'Auth',
  function($scope, $rootScope, Auth){
    $scope.signedIn = Auth.isAuthenticated;
    $scope.logout = Auth.logout;
    Auth.currentUser().then(function (user){
      $rootScope.user = user;
    });
    $scope.$on('devise:new-registration', function (e, user){
      $rootScope.user = user;
    });

    $scope.$on('devise:login', function (e, user){
      $rootScope.user = user;
    });

    $scope.$on('devise:logout', function (e, user){
      $rootScope.user = null;
    });
  }
]);
