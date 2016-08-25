'use strict';

var mongoose = require('mongoose'), Schema = mongoose.Schema;
var globalValue = require('../../config/gloval_value');
var SurveySchema = new Schema({
  firstName: {
    type:String,
    required: true
  },
  lastName:  {
    type:String,
    required: true
  },
  dateOfBirth:  {
    type:String,
    required: true
  },
  speciality: String,
  expInLanguages: [
    String
  ]
});

SurveySchema
  .path('dateOfBirth')
  .validate(function(value, respond) {
    var birthDay = new Date(value)
    if(birthDay.toString() === "Invalid Date")
      respond(false);
    respond(true);
  },'Date of birth is invalid date')
SurveySchema
  .path('dateOfBirth')
  .validate(function(value, respond) {
    var today = new Date();
    today.setHours(0,0,0,0);
    var birthDay = new Date(value);
    birthDay.setHours(0,0,0,0);
    if(birthDay.getTime() > today.getTime())
      respond(false);
    respond(true);
  },'You can\'t be born in the future!' )
SurveySchema
  .path('speciality')
  .validate(function(value, respond) {
    if(globalValue.skills.indexOf(value) < 0)
      respond(false);
    respond(true);
  },'not valid skill.' )
SurveySchema
  .path('expInLanguages')
  .validate(function(languages, respond) {
    if(!Array.isArray(languages))
      respond(false);
    languages.forEach(function(language,index){
      if(globalValue.languages.indexOf(language) < 0)
        respond(false);
    });
    respond(true);
  },'not valid language(s).' )
module.exports = mongoose.model('Survey', SurveySchema);
