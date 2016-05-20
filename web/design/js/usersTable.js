/**
 * Created by snooki on 15.05.16.
 */
$(function() {
    $('#usersTable').on('click', '.clickable-row', function(event) {
        if($(this).hasClass('bg-info')){
            $(this).removeClass('bg-info');
        } else {
            $(this).addClass('bg-info').siblings().removeClass('bg-info');
        }
    } );

    var idUser = 0;
    $('tr').on('click', function() {
        idUser = ($('td:first-child', this).text());
    });

    $("a.delete_user").click(function(e){
        e.preventDefault();
        var url = "/deleteuser?id=" + idUser;
        window.location = url;
    });

    $("a.edit_user").click(function(e){
        e.preventDefault();
        var url = "/edituser?id=" + idUser;
        window.location = url;
    });
})