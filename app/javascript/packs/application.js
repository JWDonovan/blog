// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")

window.addEventListener('DOMContentLoaded', function() {
    navbarInit();
    slugifyInit();
});

function navbarInit() {
    const navbarBurger = document.getElementById('navbar-burger');
    const mobileNavbar = document.getElementById('mobile-navbar');

    if (navbarBurger && mobileNavbar) {
        navbarBurger.addEventListener('click', function() {
            navbarBurger.classList.toggle('is-active');
            mobileNavbar.classList.toggle('is-active');
        });
    }
}

function slugify(text) {
    return text
        .toString()
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .toLowerCase()
        .trim()
        .replace(/\s+/g, '-')
        .replace(/[^\w-]+/g, '')
        .replace(/--+/g, '-');
}

function debounce(func, wait, immediate) {
	var timeout;
	return function() {
		var context = this, args = arguments;
		var later = function() {
			timeout = null;
			if (!immediate) func.apply(context, args);
		};
		var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
		if (callNow) func.apply(context, args);
	};
};

function slugifyInit() {
    const title = document.getElementById('post-title');
    const slug = document.getElementById('post-slug');

    if (title && slug) {
        title.addEventListener('input', debounce(function() {
            if (title.value) slug.value = slugify(title.value);
        }, 250));
    }
}