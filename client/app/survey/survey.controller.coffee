'use strict'

angular.module 'tigerSurveyApp'
.controller 'SurveyCtrl', ($scope, $http,toaster) ->
  init = ->
    $scope.surveys = []
    $scope.newSurvey = {}
    $scope.dateOptions =
      maxDate: new Date
    $http.get('/api/globalValues').then (globalValues) ->
      $scope.skills = globalValues.data.skills
      $scope.languages = globalValues.data.languages
    getSurveys()
  $scope.createSurvey = (form) ->
    console.log 'submit'
    $scope.submitted = true
    if form.$valid
      console.log $scope.newSurvey
      $http.post('/api/surveys',$scope.newSurvey).then (data) ->
        toaster.pop 'success','Sucees!!','Thanks for your reply!'
        getSurveys()
      .catch (err) ->
        toaster.pop 'error','Error!!','Oops, there is an error(s).'
        err = err.data
        $scope.errors = {}
        angular.forEach err.errors, (error, field) ->
          form[field].$setValidity 'mongoose', false
          $scope.errors[field] = error.message
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
