/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var Survey = require('../api/survey/survey.model');


Survey.find({}).remove(function() {
  Survey.create({
    firstName : 'jungmo',
    lastName : 'kang',
    dateOfBirth: '1980-11-27 15:00:00.000Z',
    speciality: 'Full-stack',
    expInLanguages: ['C#','JavaScript','HTML','SQL']
  }, {
    firstName : 'super',
    lastName : 'man',
    dateOfBirth: '1930-08-22 15:00:00.000Z',
    speciality: 'Front-end',
    expInLanguages: ['C#','JavaScript','HTML','SQL']
  })
});
