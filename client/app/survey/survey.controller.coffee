'use strict'

angular.module 'tigerSurveyApp'
.controller 'SurveyCtrl', ($scope, $http) ->
  init = ->
    $scope.surveys = []
    $scope.newSurvey = {}
    $http.get('/api/surveys').then (surveys) ->
      $scope.surveys = surveys.data
      console.log surveys
    $scope.datePopupOpen = false
    $scope.dateOptions =
      formatYear: 'yy'
      maxDate: new Date(2020, 5, 22)
      minDate: new Date
      startingDay: 1
  $scope.createSurvey = ->
    console.log 'submit'
    $scope.submitted = true
  $scope.dateOpen = ->
    $scope.datePopupOpen = true
  $scope.resetForm = ->
    console.log 'reset'
    $scope.submitted = false
    $scope.newSurvey = {}
  $scope.deleteThing = (thing) ->
    $http.delete '/api/things/' + thing._id
  init()


  disabled = (data) ->
    date = data.date
    mode = data.mode
    mode == 'day' and (date.getDay() == 0 or date.getDay() == 6)

  getDayClass = (data) ->
    date = data.date
    mode = data.mode
    if mode == 'day'
      dayToCheck = new Date(date).setHours(0, 0, 0, 0)
      i = 0
      while i < $scope.events.length
        currentDay = new Date($scope.events[i].date).setHours(0, 0, 0, 0)
        if dayToCheck == currentDay
          return $scope.events[i].status
        i++
    ''

  $scope.today = ->
    $scope.dt = new Date
    return

  $scope.today()

  $scope.clear = ->
    $scope.dt = null
    return

  $scope.options =
    customClass: getDayClass
    minDate: new Date
    showWeeks: true

  $scope.toggleMin = ->
    $scope.options.minDate = if $scope.options.minDate then null else new Date
    return

  $scope.toggleMin()

  $scope.setDate = (year, month, day) ->
    $scope.dt = new Date(year, month, day)
    return

  tomorrow = new Date
  tomorrow.setDate tomorrow.getDate() + 1
  afterTomorrow = new Date(tomorrow)
  afterTomorrow.setDate tomorrow.getDate() + 1
  $scope.events = [
    {
      date: tomorrow
      status: 'full'
    }
    {
      date: afterTomorrow
      status: 'partially'
    }
]
