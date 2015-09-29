angular.module('todoList').factory 'todos', [
  '$http'
  '_'
  ($http, _) ->
    o =
      todos: []
      statuses: [
        'active'
        'finished'
      ]

    o.getAll = ->
      $http.get('/todos.json').success (data) ->
        angular.copy data, o.todos
        return

    o.create = (todo) ->
      $http.post('/todos.json', todo).success (data) ->
        o.todos.push data
        return

    o.get = (id) ->
      $http.get('/todos/' + id + '.json').then (res) ->
        res.data

    o.update = (id, todo) ->
      $http.patch('/todos/' + id + '.json', todo).success (data) ->
        td = _.reject(todos.todos, (item) ->
          item.id == todo.id
        )
        td.push data
        todos.todos = td
        return

    o.destroy = (id) ->
      $http.delete 'todos/' + id + '.json'

    o
]
