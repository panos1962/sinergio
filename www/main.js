"use strict";

const menu = {};

$(document).ready(function() {
	menu.init();
});

menu.items = [
	{
		"desc": "Δελτία εισαγωγής",
		"action": function(item) {
			menu.isagogi(item);
		},
	},

	{
		"desc": "Δελτία εξαγωγής",
		"action": function(item) {
			menu.exagogi(item);
		},
	},
];

menu.init = function() {
	let bodyDOM = $(document.body);

	let menuDOM = $('<div>').
	attr('id', 'menu').
	appendTo(bodyDOM);

	for (let i = 0; i < menu.items.length; i++) {
		$('<div>').
		addClass('menuItem').
		data('item', menu.items[i]).
		text(menu.items[i].desc).
		appendTo(menuDOM);
	}

	bodyDOM.on('click', '.menuItem', menu.itemClick);

	return menu;
};

menu.itemClick = function(e) {
	e.stopPropagation();

	let item = $(this).data('item');

	if (!item)
	return;

	if (!item.hasOwnProperty('action'))
	return;

	item.action(item);
};

menu.isagogi = function(item) {
	if (item.hasOwnProperty('window'))
	item.window.close();

	setTimeout(function() {
		item.window = window.open('isagogi', 'isagogi');
	}, 10);
};
