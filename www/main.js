"use strict";

const menu = {};

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
	if (menu.wlist.hasOwnProperty('isagogi'))
	menu.wlist['isagogi'].close();

	setTimeout(function() {
		menu.wlist['isagogi'] = window.open('isagogi', 'isagogi');
	}, 10);
};

menu.exagogi = function() {
	if (menu.wlist.hasOwnProperty('exagogi'))
	menu.wlist['exagogi'].close();

	setTimeout(function() {
		let w = window.open('exagogi', 'exagogi');
		menu.wlist['exagogi'] = w;

		$(w).on('unload', function() {
console.log('asdasdasd');
			delete menu.wlist['exagogi'];
		});
	}, 10);
};

menu.unload = function() {
	for (let i in menu.wlist)
	menu.wlist[i].close();
};

setInterval(function() {
	console.log(menu.wlist);
}, 2000);
