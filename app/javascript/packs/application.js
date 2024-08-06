/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

window.Rails = require("@rails/ujs")

require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")
require("chartkick")
require("chart.js")
require('datatables.net-bs4')

import $ from 'jquery';
global.$ = jQuery;

import LocalTime from "local-time"
LocalTime.start()

// bootstrap Admin 2
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'

import 'assets/javascripts/sb-admin-2.min.js'
import 'assets/stylesheets/sb-admin-2.min.css'

import '@fortawesome/fontawesome-free/js/all'
import '@fortawesome/fontawesome-free/css/all.css'
// 

import "stylesheets/application"

import "controllers"

import "src/confirm"
import "src/direct_uploads"
import "src/forms"
import "src/timezone"

import tippy from 'tippy.js';

import 'bootstrap'
import './src/application.scss'

Notification.requestPermission().then(function (result) {})

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/service-worker.js', { scope: './' })
                         .then(function(registration) {
                           console.log('[Companion]', 'Service worker registered!')
                           console.log(registration)
                         })
}

jQuery(function($) {
    $("tr[data-link]").click(function() {
		// Same tab call :
          window.location = $(this).data('link');
        // New tab call: 
        //  window.open($(this).data('link'),"_Blank");
    });
});

$(document).on('turbolinks:load', function() {
  $('form').on('click', '.remove_record', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('tr').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.fields').append($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });  
});

$(document).ready(function() {
    $('#tasks').DataTable( {
    } );
} );

$(document).ready(function() {
    $('#documents').DataTable( {
    } );
} );

$(document).ready(function() {
    $('#discussions').DataTable( {
    } );
} );

document.addEventListener("turbolinks:load", () => {
  tippy(document.querySelectorAll('[data-tippy-content]'))
})

Rails.start()
