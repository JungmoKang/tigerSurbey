'use strict'

angular.module 'tigerSurveyApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'survey',
    url: '/'
    templateUrl: 'app/survey/survey.html'
    controller: 'SurveyCtrl'
