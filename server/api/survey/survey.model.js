'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var SurveySchema = new Schema({
  firstName: String,
  lastName: String,
  dateOfBirth: Date,
  speciality: String,
  expInLanguages: [
    String
  ]
});

module.exports = mongoose.model('Survey', SurveySchema);
