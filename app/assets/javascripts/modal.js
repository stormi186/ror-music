$(document).on("click", ".open-AddTrackDialog", function () {
     var myTrackId = $(this).data('id');
     $(".modal-body #trackId").val( myTrackId );
});