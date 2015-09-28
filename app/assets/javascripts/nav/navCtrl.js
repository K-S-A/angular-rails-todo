angular.module('todoList')
.controller('NavCtrl', [
  '$scope',
  '$rootScope',
  'todos',
  'Auth',
  function($scope, $rootScope, todos, Auth){
    $scope.signedIn = Auth.isAuthenticated;
    $scope.logout = Auth.logout;
    $scope.todos = todos.todos;
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
      var userFullName = $rootScope.user.first_name +' ' + $rootScope.user.last_name;
      $rootScope.user = null;
      todos.getAll();
      alert(userFullName + ", you're signed out now.");
    });
  }
]);
