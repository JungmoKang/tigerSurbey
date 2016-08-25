'use strict'

angular.module 'tigerSurveyApp'
.controller 'SurveyCtrl', ($scope, $http) ->
  init = ->
    $scope.surveys = []
    $scope.newSurvey = {}
    $http.get('/api/surveys').then (surveys) ->
      $scope.surveys = surveys.data
    $scope.dateOptions =
      maxDate: new Date
    $scope.skills = ['Front-end','Back-end','Full-stack']
    $scope.languages = ['C#','JavaScript','HTML','SQL']
  $scope.createSurvey = ->
    console.log 'submit'
    $scope.submitted = true
    console.log $scope.newSurvey
    
  $scope.dateOpen = ->
    $scope.datePopupOpen = true
  $scope.resetForm = ->
    console.log 'reset'
    $scope.submitted = false
    $scope.newSurvey = {}
  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id
  init()
