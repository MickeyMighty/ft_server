<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define( 'DB_NAME', 'wordpress' );

/** Utilisateur de la base de données MySQL. */
define( 'DB_USER', 'loamar' );

/** Mot de passe de la base de données MySQL. */
define( 'DB_PASSWORD', 'password' );

/** Adresse de l’hébergement MySQL. */
define( 'DB_HOST', 'localhost' );

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'nwC8@<>S|mBBV_waJG&{9i!e0s94U&)ZW4TCp-_4L!Ey:d9ZXdA4K;wI%^Xzr+#j' );
define( 'SECURE_AUTH_KEY',  '{ZS4JI@rN<7@lJguUO_0/rmYohSNk0XO_l^>cdmtg|c))~`Gk_*zg)H6veDR=ycW' );
define( 'LOGGED_IN_KEY',    '.weW?/1le<`(kfN6JEq9fr0(bvrpb|@-8Th`w>e@I_c6|2o_]Z`jq:B$SaHiB;c#' );
define( 'NONCE_KEY',        '-R242XB0z3>Gx2z20tyX%G/-d&`sQZiUT!}>@Dn&zPK{<HlscwLyE_L)iw2E@U5$' );
define( 'AUTH_SALT',        'W[:nl#{~YO`p;`$Fgd9 w vY&H-dZqD|xiy.Y!,R2-D6cGWNPs*%X];BgpTFCq!*' );
define( 'SECURE_AUTH_SALT', 'V*IJNZvZ|<aVpIN6excWRU)Pt~Q|[0t6q;k:d-DeiY]a7K)epiYvuqZ$s8sqB#Y+' );
define( 'LOGGED_IN_SALT',   '%U~|E5R:V~dTV@*,/tLyso:MWsI;H:hBmqS8T<nlm|0;i[Eb$j)+~Bs;fg,E ,$S' );
define( 'NONCE_SALT',       'z>=AROm#b4f.!1T2g^#.qAXj&OhzNsI<%{7-/{Uh$~}D2@O`/5Y~v w+g,j&[e#G' );
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');
