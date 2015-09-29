angular.module('todoList').controller 'NewTodoCtrl', [
  '$scope'
  '$state'
  'todos'
  ($scope, $state, todos) ->
    $scope.submitButton = 'Add'
    $scope.message = 'New todo item was added to your list!'
    $scope.statuses = todos.statuses
    td =
      title: ''
      description: ''
      status: 'active'
      priority: '0'
      due_date: new Date
    $scope.todo = angular.copy(td)
    $scope.minDate = new Date(td.due_date.getFullYear(), td.due_date.getMonth(), td.due_date.getDate() + 1)
    $scope.maxDate = new Date(td.due_date.getFullYear() + 10, td.due_date.getMonth(), td.due_date.getDate())

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
      todos.create $scope.todo
      $scope.notice = true
      _.delay (->
        $scope.resetForm()
        return
      ), 3000
      return

    return
]
