'use strict';

angular.module("filters", [])
.filter 'calcAge', ->
  (input) ->
    #valid check
    birthDay = new Date(input)
    if birthDay.toString() == "Invalid Date"
      return
    #calc age
    diffNowAndBirth = Date.now() - birthDay.getTime()
    ageDate = new Date(diffNowAndBirth)
    age = Math.abs(ageDate.getUTCFullYear() - 1970)
    return age
.filter 'arrayToString', ->
  (input) ->
    input.toString()
