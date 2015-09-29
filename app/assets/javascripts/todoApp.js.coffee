'use strict'

angular.module('todoList', [
  'ui.bootstrap'
  'dndLists'
  'ui.router'
  'templates'
  'underscore'
  'Devise'
]).config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('home',
      url: '/home'
      views:
        '': templateUrl: 'home/_home.html'
        'todosLists@home':
          templateUrl: 'todos/_todos_lists.html'
          controller: 'HomeCtrl'
      resolve: todoPromise: [
        'todos'
        (todos) ->
          todos.getAll()
      ]).state('todos',
      url: '/todos/:id'
      templateUrl: 'todos/_show.html'
      controller: 'TodosCtrl'
      resolve: todo: [
        '$stateParams'
        'todos'
        ($stateParams, todos) ->
          todos.get $stateParams.id
      ]).state('newTodo',
      url: '/newTodo'
      templateUrl: 'todos/_create_form.html'
      controller: 'NewTodoCtrl').state('editTodo',
      url: '/editTodo/:id'
      templateUrl: 'todos/_create_form.html'
      controller: 'EditTodoCtrl'
      resolve: todo: [
        '$stateParams'
        'todos'
        ($stateParams, todos) ->
          todos.get $stateParams.id
      ]).state('login',
      url: '/login'
      templateUrl: 'auth/_login.html'
      controller: 'AuthCtrl'
      onEnter: [
        '$state'
        'Auth'
        ($state, Auth) ->
          Auth.currentUser().then ->
            $state.go 'home'
            return
          return
      ]).state 'register',
      url: '/register'
      templateUrl: 'auth/_register.html'
      controller: 'AuthCtrl'
      onEnter: [
        '$state'
        'Auth'
        ($state, Auth) ->
          Auth.currentUser().then ->
            $state.go 'home'
            return
          return
      ]
    $urlRouterProvider.otherwise 'home'
    return
]
