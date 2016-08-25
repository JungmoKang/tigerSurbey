'use strict'

angular.module 'tigerSurveyApp'
.controller 'SurveyCtrl', ($scope, $http) ->
  init = ->
    $scope.surveys = []
    $scope.newSurvey = {}
    $scope.dateOptions =
      maxDate: new Date
    $scope.skills = ['Front-end','Back-end','Full-stack']
    $scope.languages = ['C#','JavaScript','HTML','SQL']
    getSurveys()
  $scope.createSurvey = (form) ->
    console.log 'submit'
    $scope.submitted = true
    if form.$valid
      console.log $scope.newSurvey
      $http.post('/api/surveys',$scope.newSurvey).then (data) ->
        getSurveys()
      .catch (err) ->
        console.log err


  getSurveys = ->
    $http.get('/api/surveys').then (surveys) ->
      $scope.surveys = surveys.data
  $scope.dateOpen = ->
    $scope.datePopupOpen = true
  $scope.resetForm = ->
    console.log 'reset'
    $scope.submitted = false
    $scope.newSurvey = {}
  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id
  init()
