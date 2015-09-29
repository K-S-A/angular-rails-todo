angular.module('todoList').controller 'AuthCtrl', [
  '$scope'
  '$state'
  'Auth'
  ($scope, $state, Auth) ->

    $scope.login = ->
      Auth.login($scope.user).then ->
        $state.go 'home'
        return
      return

    $scope.register = ->
      Auth.register($scope.user).then ->
        $state.go 'home'
        return
      return

    $scope.logout = ->
      Auth.logout()
      return

    return
]
