angular.module('todoList').controller 'NavCtrl', [
  '$scope'
  '$rootScope'
  'todos'
  'Auth'
  ($scope, $rootScope, todos, Auth) ->
    $scope.signedIn = Auth.isAuthenticated
    $scope.logout = Auth.logout
    $scope.todos = todos.todos
    Auth.currentUser().then (user) ->
      $rootScope.user = user
      return
    $scope.$on 'devise:new-registration', (e, user) ->
      $rootScope.user = user
      return
    $scope.$on 'devise:login', (e, user) ->
      $rootScope.user = user
      return
    $scope.$on 'devise:logout', (e, user) ->
      userFullName = $rootScope.user.first_name + ' ' + $rootScope.user.last_name
      $rootScope.user = null
      todos.getAll()
      alert userFullName + ', you\'re signed out now.'
      return
    return
]
