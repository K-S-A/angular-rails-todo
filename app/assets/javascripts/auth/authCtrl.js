angular.module('todoList')
.controller('AuthCtrl', [
  '$scope',
  '$state',
  'Auth',
  function($scope, $state, Auth){
    $scope.login = function() {
      Auth.login($scope.user).then(function(){
        $state.go('home');
      });
    };
    $scope.register = function() {
      Auth.register($scope.user).then(function(){
        $state.go('home');
      });
    };
    $scope.logout = function() {
      Auth.logout().then(function(oldUser) {
        alert(oldUser + "you're signed out now.");
      });
    }
  }
]);
