angular.module('todoList').controller 'HomeCtrl', [
  '$scope'
  '_'
  'todos'
  'listButtons'
  ($scope, _, todos, listButtons) ->
    $scope.todos = todos.todos
    $scope.statuses = todos.statuses
    $scope.buttonsGroup = listButtons.buttons
    $scope.sorting = listButtons.sorting
    $scope.order = {}
    $scope.hideList = {}

    $scope.todoShow = (todo) ->
      if todo.show
        todo.show = null
      else
        _.each $scope.todos, (item) ->
          if item.show
            item.show = null
          return
        todo.show = true
      return

    $scope.todosExpandAll = (status) ->
      _.each $scope.todos, (item) ->
        if item.status == status and !item.show
          item.show = true
        return
      return

    $scope.todosCollapseAll = (status) ->
      _.each $scope.todos, (item) ->
        if item.status == status and item.show
          item.show = null
        return
      return

    $scope.selectAll = (status) ->
      _.each $scope.todos, (item) ->
        if item.status == status
          item.selected = true
        return
      return

    $scope.unselectAll = (status) ->
      _.each $scope.todos, (item) ->
        if item.status == status
          item.selected = null
        return
      return

    $scope.revSelection = (status) ->
      _.each $scope.todos, (item) ->
        if item.status == status
          item.selected = !item.selected ? true : null
        return
      return

    $scope.destroyTodo = (id) ->
      todos.destroy id
      $scope.alert = 'Toto item is DESTROYED.'
      todos.getAll()
      return

    $scope.destroySelected = (status) ->
      _.each $scope.todos, (item) ->
        if item.selected and item.status == status
          todos.destroy item.id
          $scope.alert = 'All selected todos are DESTROYED.'
        return
      if $scope.alert
        todos.getAll()
        _.delay (->
          $scope.alert = null
          return
        ), 3000
      return

    $scope.chStatus = (status) ->
      _.each $scope.todos, (item) ->
        stats = $scope.statuses
        if item.selected == true and item.status == status
          item.status = if item.status == stats[0] then stats[1] else stats[0]
          todos.update item.id, item
          item.selected = item.show = null
        return
      return

    $scope.orderList = (param, item) ->
      revparam = '-' + param
      $scope.order[item] = if $scope.order[item] == param then revparam else param
      return

    $scope.toggleLists = (lists) ->
      _.each lists, (item) ->
        $scope.hideList[item] = !$scope.hideList[item]
        return
      return

    $scope.emptyList = (status) ->
      td = _.some($scope.todos, (item) ->
        item.status == status
      )
      td

    return
]
