$(document).on("turbolinks:load", function() {
    $(".dropdown-trigger").dropdown();
    $('.sidenav').sidenav();
    $('#fadeout').fadeOut(4000);
})