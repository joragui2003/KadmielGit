/* Use this script if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'StarsThemesIcons\'">' + entity + '</span>' + html;
	}
	var icons = {
			'font-icon-adjust' : '&#xe000;',
			'font-icon-asterisk' : '&#xe001;',
			'font-icon-ban-circle' : '&#xe002;',
			'font-icon-ban-chart' : '&#xe003;',
			'font-icon-barcode' : '&#xe004;',
			'font-icon-beaker' : '&#xe005;',
			'font-icon-bell' : '&#xe006;',
			'font-icon-bolt' : '&#xe007;',
			'font-icon-book' : '&#xe008;',
			'font-icon-bookmark' : '&#xe009;',
			'font-icon-briefcase' : '&#xe00a;',
			'font-icon-bullhorn' : '&#xe00b;',
			'font-icon-calendar' : '&#xe00c;',
			'font-icon-camera' : '&#xe00d;',
			'font-icon-certificate' : '&#xe00e;',
			'font-icon-check-empty' : '&#xe00f;',
			'font-icon-check' : '&#xe010;',
			'font-icon-cloud' : '&#xe011;',
			'font-icon-cog' : '&#xe012;',
			'font-icon-cogs' : '&#xe013;',
			'font-icon-comment' : '&#xe014;',
			'font-icon-comment-line' : '&#xe015;',
			'font-icon-comments' : '&#xe016;',
			'font-icon-comments-line' : '&#xe017;',
			'font-icon-credit-card' : '&#xe018;',
			'font-icon-dashboard' : '&#xe019;',
			'font-icon-download' : '&#xe01a;',
			'font-icon-download_2' : '&#xe01b;',
			'font-icon-edit' : '&#xe01c;',
			'font-icon-edit-check' : '&#xe01d;',
			'font-icon-email' : '&#xe01e;',
			'font-icon-email_2' : '&#xe01f;',
			'font-icon-exclamation' : '&#xe020;',
			'font-icon-eye' : '&#xe021;',
			'font-icon-eye_disable' : '&#xe022;',
			'font-icon-facetime' : '&#xe023;',
			'font-icon-film' : '&#xe024;',
			'font-icon-fire' : '&#xe025;',
			'font-icon-flag' : '&#xe026;',
			'font-icon-folder-close' : '&#xe027;',
			'font-icon-folder-open' : '&#xe028;',
			'font-icon-gift' : '&#xe029;',
			'font-icon-glass' : '&#xe02a;',
			'font-icon-glass_2' : '&#xe02b;',
			'font-icon-globe' : '&#xe02c;',
			'font-icon-globe_line' : '&#xe02d;',
			'font-icon-group' : '&#xe02e;',
			'font-icon-hdd' : '&#xe02f;',
			'font-icon-headphones-line' : '&#xe030;',
			'font-icon-headphones' : '&#xe031;',
			'font-icon-headphones-line-2' : '&#xe032;',
			'font-icon-headphones-2' : '&#xe033;',
			'font-icon-heart' : '&#xe034;',
			'font-icon-heart-line' : '&#xe035;',
			'font-icon-home' : '&#xe036;',
			'font-icon-inbox-empty' : '&#xe037;',
			'font-icon-inbox' : '&#xe038;',
			'font-icon-info' : '&#xe039;',
			'font-icon-key' : '&#xe03a;',
			'font-icon-lock' : '&#xe03b;',
			'font-icon-unlock' : '&#xe03c;',
			'font-icon-magic' : '&#xe03d;',
			'font-icon-magnet' : '&#xe03e;',
			'font-icon-map-marker' : '&#xe03f;',
			'font-icon-map-marker-2' : '&#xe040;',
			'font-icon-map' : '&#xe041;',
			'font-icon-minus' : '&#xe042;',
			'font-icon-minus-sign' : '&#xe043;',
			'font-icon-money' : '&#xe044;',
			'font-icon-move' : '&#xe045;',
			'font-icon-music' : '&#xe046;',
			'font-icon-ok' : '&#xe047;',
			'font-icon-ok-circle' : '&#xe048;',
			'font-icon-ok-sign' : '&#xe049;',
			'font-icon-picture' : '&#xe04a;',
			'font-icon-plus' : '&#xe04b;',
			'font-icon-plus-sign' : '&#xe04c;',
			'font-icon-print' : '&#xe04d;',
			'font-icon-pushpin' : '&#xe04e;',
			'font-icon-pushpin-2' : '&#xe04f;',
			'font-icon-question-sign' : '&#xe050;',
			'font-icon-random' : '&#xe051;',
			'font-icon-remove' : '&#xe052;',
			'font-icon-remove-circle' : '&#xe053;',
			'font-icon-remove-sign' : '&#xe054;',
			'font-icon-reorder' : '&#xe055;',
			'font-icon-resize-vertical' : '&#xe056;',
			'font-icon-resize-horizontal' : '&#xe057;',
			'font-icon-retweet' : '&#xe058;',
			'font-icon-road' : '&#xe059;',
			'font-icon-rss' : '&#xe05a;',
			'font-icon-search' : '&#xe05b;',
			'font-icon-shopping-cart' : '&#xe05c;',
			'font-icon-signal' : '&#xe05d;',
			'font-icon-signin' : '&#xe05e;',
			'font-icon-signout' : '&#xe05f;',
			'font-icon-sitemap' : '&#xe060;',
			'font-icon-sort' : '&#xe061;',
			'font-icon-sort-down' : '&#xe062;',
			'font-icon-sort-up' : '&#xe063;',
			'font-icon-star' : '&#xe064;',
			'font-icon-star-line' : '&#xe065;',
			'font-icon-star-half' : '&#xe066;',
			'font-icon-stars' : '&#xe067;',
			'font-icon-tag' : '&#xe068;',
			'font-icon-tags' : '&#xe069;',
			'font-icon-time' : '&#xe06a;',
			'font-icon-tint' : '&#xe06b;',
			'font-icon-upload' : '&#xe06c;',
			'font-icon-upload-2' : '&#xe06d;',
			'font-icon-user' : '&#xe06e;',
			'font-icon-user-border' : '&#xe06f;',
			'font-icon-volume-off' : '&#xe070;',
			'font-icon-volume-down' : '&#xe071;',
			'font-icon-volume-up' : '&#xe072;',
			'font-icon-warning' : '&#xe073;',
			'font-icon-wrench' : '&#xe074;',
			'font-icon-zoom-in' : '&#xe075;',
			'font-icon-zoom-out' : '&#xe076;',
			'font-icon-expand-view' : '&#xe077;',
			'font-icon-ban-chart-2' : '&#xe078;',
			'font-icon-waves' : '&#xe079;',
			'font-icon-text' : '&#xe07a;',
			'font-icon-layer' : '&#xe07b;',
			'font-icon-phone' : '&#xe07c;',
			'font-icon-phone-sign' : '&#xe07d;',
			'font-icon-phone-boxed' : '&#xe07e;',
			'font-icon-arrow-light-up' : '&#xe07f;',
			'font-icon-arrow-light-right' : '&#xe080;',
			'font-icon-arrow-light-left' : '&#xe081;',
			'font-icon-arrow-light-down' : '&#xe082;',
			'font-icon-arrow-simple-up' : '&#xe083;',
			'font-icon-arrow-simple-right' : '&#xe084;',
			'font-icon-arrow-simple-left' : '&#xe085;',
			'font-icon-arrow-simple-down' : '&#xe086;',
			'font-icon-arrow-simple-up-circle' : '&#xe087;',
			'font-icon-arrow-simple-right-circle' : '&#xe088;',
			'font-icon-arrow-simple-left-circle' : '&#xe089;',
			'font-icon-arrow-simple-down-circle' : '&#xe08a;',
			'font-icon-arrow-round-up' : '&#xe08b;',
			'font-icon-arrow-round-right' : '&#xe08c;',
			'font-icon-arrow-round-left' : '&#xe08d;',
			'font-icon-arrow-round-down' : '&#xe08e;',
			'font-icon-arrow-round-up-circle' : '&#xe08f;',
			'font-icon-arrow-round-right-circle' : '&#xe090;',
			'font-icon-arrow-round-left-circle' : '&#xe091;',
			'font-icon-arrow-round-down-circle' : '&#xe092;',
			'font-icon-arrow-light-round-up' : '&#xe093;',
			'font-icon-arrow-light-round-right' : '&#xe094;',
			'font-icon-arrow-light-round-left' : '&#xe095;',
			'font-icon-arrow-light-round-down' : '&#xe096;',
			'font-icon-arrow-light-round-up-circle' : '&#xe097;',
			'font-icon-arrow-light-round-right-circle' : '&#xe098;',
			'font-icon-arrow-light-round-left-circle' : '&#xe099;',
			'font-icon-arrow-light-round-down-circle' : '&#xe09a;',
			'font-icon-stop' : '&#xe09b;',
			'font-icon-play' : '&#xe09c;',
			'font-icon-pause' : '&#xe09d;',
			'font-icon-forward' : '&#xe09e;',
			'font-icon-backward' : '&#xe09f;',
			'font-icon-fast-forward' : '&#xe0a0;',
			'font-icon-fast-backward' : '&#xe0a1;',
			'font-icon-step-forward' : '&#xe0a2;',
			'font-icon-step-backward' : '&#xe0a3;',
			'font-icon-eject' : '&#xe0a4;',
			'font-icon-viewport' : '&#xe0a5;',
			'font-icon-expand-horizontal' : '&#xe0a6;',
			'font-icon-expand-vertical' : '&#xe0a7;',
			'font-icon-resize-horizontal-2' : '&#xe0a8;',
			'font-icon-resize-vertical-2' : '&#xe0a9;',
			'font-icon-expand-view-2' : '&#xe0aa;',
			'font-icon-expand-view-3' : '&#xe0ab;',
			'font-icon-resize-full' : '&#xe0ac;',
			'font-icon-resize-small' : '&#xe0ad;',
			'font-icon-resize-fullscreen' : '&#xe0ae;',
			'font-icon-indent-left' : '&#xe0af;',
			'font-icon-indent-right' : '&#xe0b0;',
			'font-icon-read-more' : '&#xe0b1;',
			'font-icon-blockquote' : '&#xe0b2;',
			'font-icon-file-empty' : '&#xe0b3;',
			'font-icon-file' : '&#xe0b4;',
			'font-icon-copy' : '&#xe0b5;',
			'font-icon-paste' : '&#xe0b6;',
			'font-icon-align-left' : '&#xe0b7;',
			'font-icon-align-right' : '&#xe0b8;',
			'font-icon-align-center' : '&#xe0b9;',
			'font-icon-align-justify' : '&#xe0ba;',
			'font-icon-link' : '&#xe0bb;',
			'font-icon-columns' : '&#xe0bc;',
			'font-icon-columns-2' : '&#xe0bd;',
			'font-icon-table' : '&#xe0be;',
			'font-icon-list' : '&#xe0bf;',
			'font-icon-list-2' : '&#xe0c0;',
			'font-icon-list-3' : '&#xe0c1;',
			'font-icon-grid' : '&#xe0c2;',
			'font-icon-grid-large' : '&#xe0c3;',
			'font-icon-repeat' : '&#xe0c4;',
			'font-icon-paper-clip' : '&#xe0c5;',
			'font-icon-text-height' : '&#xe0c6;',
			'font-icon-text-width' : '&#xe0c7;',
			'font-icon-font' : '&#xe0c8;',
			'font-icon-bold' : '&#xe0c9;',
			'font-icon-italic' : '&#xe0ca;',
			'font-icon-underline' : '&#xe0cb;',
			'font-icon-strikethrough' : '&#xe0cc;',
			'font-icon-social-500px' : '&#xe0cd;',
			'font-icon-social-addthis' : '&#xe0ce;',
			'font-icon-social-behance' : '&#xe0cf;',
			'font-icon-social-bebo' : '&#xe0d0;',
			'font-icon-social-blogger' : '&#xe0d1;',
			'font-icon-social-deviant-art' : '&#xe0d2;',
			'font-icon-social-digg' : '&#xe0d3;',
			'font-icon-social-dribbble' : '&#xe0d4;',
			'font-icon-social-email' : '&#xe0d5;',
			'font-icon-social-envato' : '&#xe0d6;',
			'font-icon-social-evernote' : '&#xe0d7;',
			'font-icon-social-facebook' : '&#xe0d8;',
			'font-icon-social-flickr' : '&#xe0d9;',
			'font-icon-social-forrst' : '&#xe0da;',
			'font-icon-social-github' : '&#xe0db;',
			'font-icon-social-google-plus' : '&#xe0dc;',
			'font-icon-social-grooveshark' : '&#xe0dd;',
			'font-icon-social-last-fm' : '&#xe0de;',
			'font-icon-social-linkedin' : '&#xe0df;',
			'font-icon-social-myspace' : '&#xe0e0;',
			'font-icon-social-paypal' : '&#xe0e1;',
			'font-icon-social-photobucket' : '&#xe0e2;',
			'font-icon-social-pinterest' : '&#xe0e3;',
			'font-icon-social-quora' : '&#xe0e4;',
			'font-icon-social-share-this' : '&#xe0e5;',
			'font-icon-social-skype' : '&#xe0e6;',
			'font-icon-social-soundcloud' : '&#xe0e7;',
			'font-icon-social-stumbleupon' : '&#xe0e8;',
			'font-icon-social-tumblr' : '&#xe0e9;',
			'font-icon-social-twitter' : '&#xe0ea;',
			'font-icon-social-viddler' : '&#xe0eb;',
			'font-icon-social-vimeo' : '&#xe0ec;',
			'font-icon-social-virb' : '&#xe0ed;',
			'font-icon-social-wordpress' : '&#xe0ee;',
			'font-icon-social-yahoo' : '&#xe0ef;',
			'font-icon-social-yelp' : '&#xe0f0;',
			'font-icon-social-youtube' : '&#xe0f1;',
			'font-icon-social-zerply' : '&#xe0f2;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, html, c, el;
	for (i = 0; i < els.length; i += 1) {
		el = els[i];
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/font-icon-[^\s'"]+/);
		if (c) {
			addIcon(el, icons[c[0]]);
		}
	}
};