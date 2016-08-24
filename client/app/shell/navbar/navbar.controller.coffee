'use strict'

angular.module 'tigerSurveyApp'
.controller 'NavbarCtrl', ($scope, $location) ->
  $scope.menu = [
    title: 'Survey'
    link: '/'
  ]
  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    route is $location.path()
