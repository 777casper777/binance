$( function() {
    $( "#datepicker_for" ).datepicker();
    $( "#datepicker_to" ).datepicker();
} );
$.datepicker.setDefaults({
    dateFormat: 'dd-mm-yy'
});