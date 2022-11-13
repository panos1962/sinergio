var iliko = {};

$(window).on('unload', function() {
	try {
		delete self.opener.menu.wlist['iliko'];
	} catch (e) {}
});

$(document).ready(function() {
	iliko.init();
});

iliko.init = function() {
	iliko.bodyDOM = $(document.body);
	iliko.
	kritiriaSetup().
	browserSetup();

	return iliko;
};

iliko.kritiriaSetup = function() {
	iliko.kritiriaDOM = $('<div>').
	attr('id', 'kritiria').
	appendTo(iliko.bodyDOM);

	iliko.kritiriaDOM.append('xxx');

	return iliko;
};

iliko.browserSetup = function() {
	iliko.browserDOM = $('<div>').
	attr('id', 'browser').
	appendTo(iliko.bodyDOM);

	iliko.browserDOM.append('xxx');

	return iliko;
};
