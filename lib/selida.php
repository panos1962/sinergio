<?php

class selida {
	private static $init_ok = FALSE;
	private static $root_url;

	public static function init() {
		if (self::$init_ok)
		return __CLASS__;

		self::$init_ok = TRUE;

		$host = $_SERVER["HTTP_HOST"];

		switch ($host) {
		case 'localhost':
		case '127.0.0.1':
			$host .= "/sinergio";
			break;
		}

		self::$root_url = "http";

		if (array_key_exists("HTTPS", $_SERVER) && $_SERVER["HTTPS"])
		self::$root_url .= "s";

		self::$root_url .= "://" . $host;

		return __CLASS__;
	}

	public static function url($file) {
		return self::$root_url . "/" . $file;
	}
		
	public static function html_open() {
?>
<!DOCTYPE html>
<html>
<?php

		return __CLASS__;
	}

	public static function html_close() {
?>
</html>
<?php

		return __CLASS__;
	}

	public static function head_open() {
?>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script src="<?php print self::url("lib/selida.js"); ?>"></script>
<?php

		return __CLASS__;
	}

	public static function head_close() {
		if (file_exists("main.css"))
		self::css("main");

		if (file_exists("main.js"))
		self::script("main");
?>
</head>
<?php

		return __CLASS__;
	}

	public static function body_open() {
?>
<body>
<?php

		return __CLASS__;
	}

	public static function body_close() {
?>
</body>
<?php

		return __CLASS__;
	}

	private static $favicon_types = [
		"ico" => "image/x-icon",
		"png" => "image/png",
		"gif" => "image/gif",
	];

	public static function favicon($favicon) {
		$parts = explode(".", $favicon);
		$count = count($parts);

		if ($count < 2)
		exit($favicon . ": undefined favicon image type");

		$tipos = $parts[$count - 1];

		if (!array_key_exists($tipos, self::$favicon_types))
		exit($favicon . ": invalid favicon image type");
?>
<link rel="icon" type="<?php
print self::$favicon_types[$tipos]; ?>" href="<?php
print $favicon; ?>">
<?php

		return __CLASS__;
	}

	public static function title($title) {
?>
<title><?php print $title; ?></title>
<?php

		return __CLASS__;
	}

	public static function css($css) {
		if (!preg_match("/\.css$/", $css))
		$css .= ".css";

		if (($mt = filemtime($css)) === FALSE)
		exit($css . ": file not found");

?>
<link rel="stylesheet" href="<?php print $css; ?>?mt=<?php print $mt; ?>">
<?php

		return __CLASS__;
	}

	public static function script($script) {
		if (!preg_match("/\.js$/", $script))
		$script .= ".js";

		if (($mt = filemtime($script)) === FALSE)
		exit($script . ": file not found");

?>
<script src="<?php print $script; ?>?mt=<?php print $mt; ?>"></script>
<?php

		return __CLASS__;
	}
}

selida::init();

?>
