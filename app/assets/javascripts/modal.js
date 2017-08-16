$(document).on("click", ".open-AddTrackDialog", function () {
     var myTrackId = $(this).data('id');
     $(".modal-body #trackId").val( myTrackId );
     // As pointed out in comments, 
     // it is superfluous to have to manually call the modal.
     // $('#addBookDialog').modal('show');
});