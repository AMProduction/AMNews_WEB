/**
 * Created by snooki on 31.03.16.
 */
$(function() {
    $('#newsTable').on('click', '.clickable-row', function(event) {
        if($(this).hasClass('bg-info')){
            $(this).removeClass('bg-info');
        } else {
            $(this).addClass('bg-info').siblings().removeClass('bg-info');
        }
    } );

    var idNews = 0;
    $('tr').on('click', function() {
        idNews = ($('td:first-child', this).text());
    });

    $("a.delete_item").click(function(e){
        e.preventDefault();
        var url = "/delete?id=" + idNews;
        window.location = url;
    });

    $("a.edit_item").click(function(e){
        e.preventDefault();
        var url = "/edit?hideUpdate=0&hideSave=1&id=" + idNews;
        window.location = url;
    });
})