angular.module('todoList').controller 'EditTodoCtrl', [
  '$scope'
  '_'
  '$state'
  'todo'
  'todos'
  ($scope, _, $state, todo, todos) ->
    $scope.submitButton = 'Update'
    $scope.message = 'Todo item was updated in your list!'
    $scope.statuses = todos.statuses
    $scope.todo = angular.copy(todo)
    $scope.todo.priority = todo.priority.toString()
    $scope.todo.due_date = new Date(todo.due_date)
    $scope.minDate = new Date

    $scope.fixPastDate = () ->
      if ($scope.todo.due_date < new Date() && new Date(todo.due_date) <= new Date())
        $scope.todo.due_date = new Date(todo.due_date)
      else if ($scope.todo.due_date < new Date())
          $scope.todo.due_date = new Date()
      return
      return

    $scope.resetForm = ->
      $state.reload()
      return

    $scope.open = ($event) ->
      $scope.opened = true
      return

    $scope.dateOptions = startingDay: 1

    $scope.valClass = (item) ->
      o = if $scope.todoForm[item].$dirty then (if $scope.todoForm[item].$valid then 'has-success' else 'has-error') else ''
      o

    $scope.addTodo = ->
      $scope.todo.due_date = $scope.todoForm.date.$viewValue
      todos.update todo.id, $scope.todo
      $scope.notice = true
      _.delay (->
        $scope.resetForm()
        return
      ), 3000
      return

    return
]
