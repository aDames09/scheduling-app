/**
* @module Animations
*/

@import '../loading/cookie.js';
@import 'libs/aos.js';

/**
@class animations
@static
*/

/**
@method load-animate
*/

document.querySelectorAll('body')[0].classList.add('animate-enabled');
cookie( 'animate-site', "true", 7 );

AOS.init({
	anchorPlacement: "bottom-bottom"
});
