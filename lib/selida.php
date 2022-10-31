<?php

class selida {
	private static $init_ok = FALSE;
	private static $favicon_ok = FALSE;
	private static $title_ok = FALSE;
	private static $base_www;
	private static $base_dir;

	public static function init() {
		if (self::$init_ok)
		return __CLASS__;

		self::$init_ok = TRUE;
		self::base_dir_set();
		self::base_www_set();

		return __CLASS__;
	}

	private static function base_dir_set() {
		self::$base_dir = preg_replace("/\/lib\/selida\.php$/", "", __FILE__);

		return __CLASS__;
	}

	private static function base_www_set() {
		$host = $_SERVER["HTTP_HOST"];

		switch ($host) {
		case 'localhost':
		case '127.0.0.1':
			$host .= "/sinergio";
			break;
		}

		self::$base_www = "http";

		if (array_key_exists("HTTPS", $_SERVER) && $_SERVER["HTTPS"])
		self::$base_www .= "s";

		self::$base_www .= "://" . $host;

		return __CLASS__;
	}

	public static function www($file) {
		$www = self::$base_www;

		if (substr($file, 0, 1) !== "/")
		$www .= "/";

		return $www . $file;
	}

	public static function www_print($file) {
		print self::www($file);

		return __CLASS__;
	}

	public static function full_dir($file) {
		$full_dir = self::$base_dir;

		if (substr($file, 0, 1) !== "/")
		$full_dir .= "/";

		return $full_dir . $file;
	}

	public static function full_dir_print($file) {
		print self::full_dir($file);

		return __CLASS__;
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
<script src="<?php self::www_print("lib/selida.js"); ?>"></script>
<?php

		return __CLASS__;
	}

	public static function head_close() {
		if (!self::$favicon_ok)
		self::favicon("images/sinergio.png");

		if (!self::$title_ok)
		self::title("Συνεργείο");

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
self::www_print($favicon); ?>">
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
