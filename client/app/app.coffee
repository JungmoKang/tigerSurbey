'use strict'

angular.module 'tigerSurveyApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
  'filters'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
