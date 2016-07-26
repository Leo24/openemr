$( document ).ready(function() {
    var tz = jstz.determine();
    $('input.timezone').attr('value', tz.name());
});