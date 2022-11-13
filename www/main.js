"use strict";

var menu = {};

$(document).ready(function() {
	menu.init();
});

$(window).on('unload', function() {
	menu.unload();
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

	{
		"desc": "Υλικά",
		"action": function(item) {
			menu.iliko(item);
		},
	},

	{
		"desc": "Αποδέκτες",
		"action": function(item) {
			menu.apode(item);
		},
	},

	{
		"desc": "Προμηθευτές",
		"action": function(item) {
			menu.promi(item);
		},
	},
];

menu.init = function() {
	window.name = 'sinergio';
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

menu.wlist = {};

menu.isagogi = function() {
	if (!menu.wlist.hasOwnProperty('isagogi'))
	menu.wlist['isagogi'] = window.open('isagogi/index.php', 'isagogi');

	menu.wlist['isagogi'].focus();
};

menu.exagogi = function() {
	if (menu.wlist.hasOwnProperty('exagogi'))
	menu.wlist['exagogi'].close();

	menu.wlist['exagogi'].focus();
};

menu.iliko = function() {
	if (!menu.wlist.hasOwnProperty('iliko'))
	menu.wlist['iliko'] = window.open('iliko/index.php', 'iliko');

	menu.wlist['iliko'].focus();
};

menu.unload = function() {
	for (let i in menu.wlist)
	menu.wlist[i].close();
};
