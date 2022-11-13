<?php

require("/var/opt/kalosi/lib/kalosi.php");
kalosi::init("/var/opt/sinergio/local/conf.php");

class sinergio {
	static public function selida($opts = NULL) {
		if (!isset($opts))
		$opts = [];

		if (!array_key_exists("database", $opts))
		$opts["database"] = true;

		kalosi::
		header_html()::
		head_section()::
		jQuery();

		if (array_key_exists("jQueryUI", $opts))
		kalosi::jQueryUI();

		if (array_key_exists("favicon", $opts))
		kalosi::favicon($opts["favicon"]);

		if (array_key_exists("title", $opts))
		kalosi::title($opts["title"]);

		if ($opts["database"])
		kalosi::database();

		kalosi::
		css(kalosi::www("lib/sinergio.css"))::
		body_section()::
		html_close();

		return __CLASS__;
	}

	static public function data_json($opts = NULL) {
		if (!isset($opts))
		$opts = [
			"database" => true,
		];

		if ($opts["database"])
		kalosi::title($opts["database"]);

		kalosi::header_json();
		return __CLASS__;
	}

	static public function data_text($opts = NULL) {
		if (!isset($opts))
		$opts = [
			"database" => true,
		];

		if ($opts["database"])
		kalosi::title($opts["database"]);

		kalosi::header_text();
		return __CLASS__;
	}
}

?>
