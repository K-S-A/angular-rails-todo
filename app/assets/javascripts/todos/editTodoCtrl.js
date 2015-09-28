angular.module('todoList')
.controller('EditTodoCtrl', [
  '$scope',
  '_',
  '$state',
  'todo',
  'todos',
  function($scope, _, $state, todo, todos){
    $scope.submitButton = 'Update';
    $scope.message = 'Todo item was updated in your list!';
    $scope.statuses = todos.statuses;
    $scope.todo = angular.copy(todo);
    $scope.todo.priority = todo.priority.toString();
    $scope.todo.due_date = new Date(todo.due_date);
    $scope.minDate = new Date();
    $scope.resetForm = function(){
      $state.reload();
    };
    $scope.open = function($event){
      $scope.opened = true;
    };
    $scope.dateOptions = {
      startingDay: 1
    };
    $scope.valClass = function(item){
      o = ($scope.todoForm[item].$dirty) ? ($scope.todoForm[item].$valid) ? 'has-success' : 'has-error' : '';
      return o;
    };
    $scope.addTodo = function(){
      todos.update(todo.id, $scope.todo);
      $scope.notice = true;
      _.delay(function (){
        $scope.resetForm()
      }, 3000);
    }
  }
])
