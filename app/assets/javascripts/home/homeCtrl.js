angular.module('todoList')
.controller('HomeCtrl', [
  '$scope',
  '_',
  'todos',
  'listButtons',
  function($scope, _, todos, listButtons){
    $scope.todos = todos.todos;
    $scope.statuses = todos.statuses;
    $scope.buttonsGroup = listButtons.buttons;
    $scope.sorting = listButtons.sorting;
    $scope.order = {};
    $scope.hideList = {};

    $scope.todoShow = function(todo){
      if (todo.show) {
        todo.show = null;
      } else {
        _.each($scope.todos, function(item){
          if (item.show) {item.show = null}
        });
        todo.show = true
      };
    };
    $scope.todosExpandAll = function(status){
      _.each($scope.todos, function(item){
        if (item.status === status && item.show == null) { item.show = true; }
      })
    };
    $scope.todosCollapseAll = function(status){
      _.each($scope.todos, function(item){
        if (item.status === status && item.show === true) { item.show = null; }
      })
    };
    $scope.selectAll = function(status){
      _.each($scope.todos, function(item){
        if (item.status === status) { item.selected = true; }
      })
    };
    $scope.unselectAll = function(status){
      _.each($scope.todos, function(item){
        if (item.status === status) { item.selected = null; }
      })
    };
    $scope.revSelection = function(status){
      _.each($scope.todos, function(item){
        if (item.status === status) {
          item.selected = (item.selected == null) ? true: null;
        }
      })
    };
    $scope.destroyTodo = function(id){
      todos.destroy(id);
      $scope.alert = 'Toto item is DESTROYED.';
      todos.getAll()
    };
    $scope.destroySelected = function(status){
      _.each($scope.todos, function (item) {
        if (item.selected && item.status === status) {
          todos.destroy(item.id);
          $scope.alert = 'All selected todos are DESTROYED.';
        };
      });
      if ($scope.alert) {
        todos.getAll();
        _.delay(function (){
          $scope.alert = null;
        }, 3000);
      }
    };
    $scope.chStatus = function(status){
      _.each($scope.todos, function(item){
        var stats = $scope.statuses;
        if (item.selected === true && item.status === status) {
          item.status = (item.status == stats[0]) ? stats[1] : stats[0];
          todos.update(item.id, item);
          item.selected = item.show = null;
        }
      })
    };
    $scope.orderList = function(param, item){
      var revparam = '-' + param;
      $scope.order[item] = ($scope.order[item] === param) ? revparam : param;
    };
    $scope.toggleLists = function(lists){
      _.each(lists, function(item){
        $scope.hideList[item] = !$scope.hideList[item];
      })
    };
    $scope.emptyList = function(status){
      var td = _.some($scope.todos, function(item){
        return item.status == status
      });
      return td;
    }
  }
])
