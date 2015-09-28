angular.module('todoList')
.factory('todos', [
  '$http',
  '_',
  function($http, _){
  var o = {
    todos: [],
    statuses: ['active', 'finished']
  };
  o.getAll = function() {
    return $http.get('/todos.json').success(function(data){
      angular.copy(data, o.todos);
    });
  };
  o.create = function(todo) {
    return $http.post('/todos.json', todo).success(function(data){
      o.todos.push(data);
    });
  };
  o.get = function(id) {
    return $http.get('/todos/' + id + '.json').then(function(res){
      return res.data;
    });
  };
  o.update = function(id, todo){
    return $http.patch('/todos/' + id + '.json', todo).success(function(data){
      var td = _.reject(todos.todos, function(item){
        return item.id == todo.id
      });
      td.push(data);
      todos.todos = td;
    })
  };
  o.destroy = function(id){
    return $http.delete('todos/' + id + '.json')
  };
  return o;
}])
