angular.module('todoList')
.controller('NewTodoCtrl', [
  '$scope',
  '$state',
  'todos',
  function($scope, $state, todos){
    $scope.submitButton = 'Add';
    $scope.message = 'New todo item was added to your list!';
    $scope.statuses = todos.statuses;
    var td = {
      title: '',
      description: '',
      status: 'active',
      priority: '0',
      due_date: new Date()
    };
    $scope.todo = angular.copy(td);
    $scope.minDate = new Date(td.due_date.getFullYear(), td.due_date.getMonth(), (td.due_date.getDate() + 1));
    $scope.maxDate = new Date((td.due_date.getFullYear() + 10), td.due_date.getMonth(), td.due_date.getDate());

    $scope.resetForm = function(){
      $state.reload();
    };
    $scope.open = function($event) {
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
      todos.create($scope.todo);
      $scope.notice = true;
      _.delay(function (){
        $scope.resetForm();
      }, 3000);
    }
  }
])
