"use strict";

angular.module('todoList', ['ui.bootstrap', 'dndLists', 'ui.router', 'templates', 'underscore', 'Devise'])
.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('home', {
        url: '/home',
        views: {
          '': { templateUrl: 'home/_home.html' },
          'todosLists@home': {
            templateUrl: 'todos/_todos_lists.html',
            controller: 'HomeCtrl'
          }
        },
        resolve: {
          todoPromise: ['todos', function(todos){
            return todos.getAll();
          }]
        }
      })
      .state('todos', {
        url: '/todos/:id',
        templateUrl: 'todos/_show.html',
        controller: 'TodosCtrl',
        resolve: {
          todo: ['$stateParams', 'todos', function($stateParams, todos) {
            return todos.get($stateParams.id);
          }]
        }
      })
      .state('newTodo', {
        url: '/newTodo',
        templateUrl: 'todos/_create_form.html',
        controller: 'NewTodoCtrl'
      })
      .state('editTodo', {
        url: '/editTodo/:id',
        templateUrl: 'todos/_create_form.html',
        controller: 'EditTodoCtrl',
        resolve: {
          todo: ['$stateParams', 'todos', function($stateParams, todos) {
            return todos.get($stateParams.id);
          }]
        }
      })
      .state('login', {
        url: '/login',
        templateUrl: 'auth/_login.html',
        controller: 'AuthCtrl',
        onEnter: ['$state', 'Auth', function($state, Auth) {
          Auth.currentUser().then(function (){
            $state.go('home');
          })
        }]
      })
      .state('register', {
        url: '/register',
        templateUrl: 'auth/_register.html',
        controller: 'AuthCtrl',
        onEnter: ['$state', 'Auth', function($state, Auth) {
          Auth.currentUser().then(function (){
            $state.go('home');
          })
        }]
      });

    $urlRouterProvider.otherwise('home');
  }
])
/*
.run(['$rootScope',
  '$state',
  'Auth',
  function($rootScope, $state, Auth) {
    $rootScope.$on('$stateChangeStart', function(event, toState) {
    // don't check auth on login routes
      if (["register", "login"].indexOf(toState.name) === -1) {
        if (!Auth.currentUser()) {
          event.preventDefault();
          $state.go('register');
          return;
        }
      }
    })
  }
]);
*/
