'use strict'

angular.module 'tigerSurveyApp'
.controller 'SurveyCtrl', ($scope, $http,toaster) ->
  init = ->
    initValues()
    thirtyYearsAgo = new Date()
    thirtyYearsAgo.setYear(thirtyYearsAgo.getFullYear() - 30)
    $scope.dateOptions =
      maxDate: new Date
      initDate: thirtyYearsAgo
    $http.get('/api/globalValues').then (globalValues) ->
      $scope.skills = globalValues.data.skills
      $scope.languages = globalValues.data.languages
    getSurveys()
  initValues = ->
    $scope.surveys = []
    $scope.newSurvey = {}
    $scope.submitted = false
    getSurveys()
  $scope.createSurvey = (form) ->
    $scope.submitted = true
    if form.$valid
      $http.post('/api/surveys',$scope.newSurvey).then (data) ->
        toaster.pop 'success','Sucees!!','Thanks for your reply!'
        initValues()
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
  $scope.resetForm = ->
    $scope.submitted = false
    $scope.newSurvey = {}
  init()
