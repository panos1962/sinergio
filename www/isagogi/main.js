"use strict";

const isagogi = {};

$(document).ready(function() {
	isagogi.init();
});

isagogi.init = function() {
	isagogi.bodyDOM = $(document.body);

	const kritiriaDOM = $('<div>').
	attr('id', 'kritiria');
	
	const kritiriaFormaDOM = $('<form>').
	on('submit', function() {
		return false;
	}).
	appendTo(kritiriaDOM);

	$('<label>').
	prop('for', 'idKritirio').
	text('Κωδικός').
	appendTo(kritiriaFormaDOM);

	isagogi.idKritirioDOM = $('<input>').
	attr('id', 'idKritirio').
	appendTo(kritiriaFormaDOM);

	$('<label>').
	prop('for', 'apoKritirio').
	text('Από').
	appendTo(kritiriaFormaDOM);

	isagogi.apoKritirioDOM = $('<input>').
	attr('id', 'apoKritirio').
	datepicker().
	appendTo(kritiriaFormaDOM);

	$('<label>').
	prop('for', 'eosKritirio').
	text('Έως').
	appendTo(kritiriaFormaDOM);

	isagogi.eosKritirioDOM = $('<input>').
	attr('id', 'eosKritirio').
	datepicker().
	appendTo(kritiriaFormaDOM);

	$('<label>').
	prop('for', 'promiKritirio').
	text('Προμηθευτής').
	appendTo(kritiriaFormaDOM);

	isagogi.promiKritirioDOM = $('<input>').
	attr('id', 'promiKritirio').
	prop('type', 'text').
	appendTo(kritiriaFormaDOM);

	$('<button>').
	prop('type', 'submit').
	text('Υποβολή').
	appendTo(kritiriaFormaDOM);
	

	kritiriaDOM.
	appendTo(isagogi.bodyDOM);
};
