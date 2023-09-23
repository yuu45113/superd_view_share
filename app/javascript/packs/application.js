// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import $ from"jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";
import "./slick.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ref: https://qiita.com/hiroyayamamo/items/b258acbaa089d9482c8a
$(document).on('turbolinks:load', function() {
  $(function() {
    $('.slider').slick({
        dots: true,
        // autoplay: true,
        // autoplaySpeed: 1000,
    });
  });
});