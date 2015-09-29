angular.module('todoList').controller 'TodosCtrl', [
  '$scope'
  'todo'
  ($scope, todo) ->
    $scope.todo = todo
    return
]
