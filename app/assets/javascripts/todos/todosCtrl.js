angular.module('todoList')
.controller('TodosCtrl', [
  '$scope',
  'todo',
  function($scope, todo){
    $scope.todo = todo;
  }
])
