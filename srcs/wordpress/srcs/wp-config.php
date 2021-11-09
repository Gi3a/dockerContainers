<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'root' );

define( 'DB_PASSWORD', '1234' );

define( 'DB_HOST', 'mysql' );

define( 'DB_CHARSET', 'utf8' );


define( 'DB_COLLATE', '' );
define('AUTH_KEY',         '(TY!;FTGm=<75U^4/re4CsOq%Ft9#|7[Tcz2O>:1<iK,S*0H>Ydt0|Hh{e*4`jvvm');
	define('SECURE_AUTH_KEY',  '?7q%b[-JahYnf*`l`JLrN)?B,:3K+5f4*;t*B_sH50MAqC]OPy[YFj4+_aJa[_n~');
	define('LOGGED_IN_KEY',    '(s--qrxZ[`Q|pQmQ=6&dcPxIg`rw5Fp89%>Fy?[Y,{3{mBRBBWRN=8c)23]/RC8d');
	define('NONCE_KEY',        'v[A5o9|EWyzX3gwZwoi*>wb}W+{#mWR1RU{)]-EH+^}h0D)6Gb0:m-t,GM22cgp_');
	define('AUTH_SALT',        '`|g+|zuMt8Gh;b9FLEW&qU~_W8<2I%w5Fp89%>Fy?[ICntBHh+rBef#,IU$/R<72');
	define('SECURE_AUTH_SALT', '26iU,W`1:=t|*}WN>%|y5^&Lf61/[3<2I6ZRef4x1aS+enQj57?4+Y~ 5&XW3]KB');
	define('LOGGED_IN_SALT',   'SAD,SAOD,SOADPKW,09OKD0O21L-0WQLS1-0SX-P[.L0-P[XCOODWKDOWKCOWEDK');
	define('NONCE_SALT',       'OSSAKDK10WOPKD9-K0WLS0-LD;032O.0-OS0O2023SOX2O.O230O.DOX2.0SL2XS');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';