$(document).ready(function() {
    if ($('.flash').text() !== "") {
        Materialize.toast($('.flash').text(), 5000);
    };

    $('#navbar-dropdown').on('click', function() {
        $('#dropdown-button').dropdown();
    })
})